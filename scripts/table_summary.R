library(dplyr)
library(lintr)
library(styler)

# Aggregate summary table by year of NBA finals
summary_table <- function(NBA) {
  tab <- NBA %>%
    group_by(Year) %>%
    summarise(
      fg_percentage = sum(FG, na.rm = TRUE) / sum(FGA, na.rm = TRUE),
      fg_attempted = sum(FGA, na.rm = TRUE),
      fg = sum(FG, na.rm = TRUE),
      fg_total_points = sum(FG, na.rm = TRUE) * 2,
      ft_percentage = sum(FT, na.rm = TRUE) / sum(FTA, na.rm = TRUE),
      ft_attempted = sum(FTA, na.rm = TRUE),
      ft = sum(FT, na.rm = TRUE),
      ft_total_points = sum(FT, na.rm = TRUE),
      tp_percentage = sum(TP, na.rm = TRUE) / sum(TPA, na.rm = TRUE),
      tp_attempted = sum(TPA, na.rm = TRUE),
      tp = sum(TP, na.rm = TRUE),
      tp_total_points = sum(TP, na.rm = TRUE) * 3
    )
  return(tab)
}
