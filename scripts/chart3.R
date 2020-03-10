# Loads necessary packages
library(ggplot2)
library(dplyr)
library(lintr)

chart3_function <- function(df) {
  plot <- df %>%
    ggplot(aes_string(x = "PTS")) + geom_histogram(binwidth = 2.5) +
    labs(
      title = "Disrtribution of Points Scored in NBA Finals Over the Years (1980 - 2018)",
      x = "Points Scored",
      y = "Frequency"
    )
  return(plot)
}
