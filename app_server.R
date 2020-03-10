library(dplyr)
library(shiny)
library(ggplot2)
source("scripts/table_summary.R")
champions<- read.csv("data/championsdata.csv", stringsAsFactors = FALSE)
runnerups <- read.csv("data/runnerupsdata.csv", stringsAsFactors = FALSE)
full_finals <- bind_rows(champions, runnerups)


server <- function(input, output) {
  output$pie <- renderPlotly({
    title <- paste0("Total Shots in the NBA Finals")
    pie_data <- summary_table(full_finals) %>%
      select(Year, ft, fg, tp)
    pie_data1 <- t(pie_data[-1])
    pie_data1 <- as.data.frame(pie_data1)
    colnames(pie_data1) <- pie_data[["Year"]]
    pie_data1 <- mutate(pie_data1, shot = c("Free Throw", "Field Goal", "Three Pointer"))
    # pie <- ggplot(pie_data1,
    #                aes(x = "", y = !!as.name(input$final_year), fill = shot)) +
    #   geom_bar(width = 1, stat = "identity") +
    #   coord_polar("y", start = 0)
    pie <- plot_ly(pie_data1,
                   labels = ~shot,
                   values = !!as.name(~input$final_year),
                   type = "pie")
    pie
  })
}
