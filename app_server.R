library(dplyr)
library(shiny)
library(ggplot2)
source("scripts/table_summary.R")
champions <- read.csv("data/championsdata.csv", stringsAsFactors = FALSE)
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
    pie_data1 <- mutate(pie_data1, shot =
                          c("Free Throw", "Field Goal", "Three Pointer"))
    finals_year <- as.name(input$final_year)
    pie <- plot_ly(pie_data1,
                   labels = ~shot,
                   values = pie_data1[[finals_year]],
                   type = "pie")
    pie <- pie %>%
      layout(title = title)
    pie
  })

  output$bar <- renderPlotly(
    ggplot(data = filter(full_finals, Year == input$picked_year),
           aes(x = Team, y = DRB, fill = Team)) +
      geom_bar(colour = "black", stat = "identity") +
      labs(
        title = "Defensive Rebounds",
        x = paste("Teams in the Championship for the year", input$picked_year),
        y = paste("Total Defensive Rebounds Scored in",
                  input$picked_year, "series")
      )
  )

  output$scatterplot <- renderPlot(
    ggplot(data = filter(full_finals, Year == input$chosen_year)) +
      geom_point(mapping = aes_string(
        x = "AST",
        y = "PTS"
      )) +
      labs(
        title = "Assists vs. Points",
        x = paste("Assists in", input$chosen_year),
        y = paste("Points in", input$chosen_year)
      )
  )
}
