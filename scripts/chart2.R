# Loads the necessary packages
library(ggplot2)
library(dplyr)
library(lintr)

# Creates a function that returns a scatterplot with the x-axis as assists
# and y-axis as points.
chart2_function <- function(df) {
  scatterplot <- ggplot(df) +
    geom_point(mapping = aes_string(x = "AST", y = "PTS")) +
    labs(
      title = "Association Between Assists and Points",
      x = "Assists",
      y = "Points"
    ) +
    geom_smooth(method = lm, formula = y ~ splines::bs(x, 3), se = FALSE,
                mapping = aes_string(x = "AST", y = "PTS"))
  return(scatterplot)
}