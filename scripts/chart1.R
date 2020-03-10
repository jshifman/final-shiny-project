# Load in packages
library(dplyr)
library(ggplot2)

# Making a bar chart, with the x-axis being years from 1980 to 2018,
# and the y-axis being three points attempted with a scale from 0 to 200
chart1_function <- function(df) {
  year_vs_tpa <- df %>%
    #Create the bar chart retrieve the data
    ggplot(aes_string(x = "Year", y = "TPA")) +
    geom_bar(stat = "identity") +
    #Label the axis and the chart
    labs(
      title = "Year vs Three Points Attempted",
      x = "Years (1980-2018)",
      y = "Three Points Attempted") +
    #set limits to the y axis
    coord_cartesian(ylim = c(0, 200))
  return(year_vs_tpa)
}
