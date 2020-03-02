library(dplyr)
library(lintr)
library(styler)

# Aggregate summary table by year of NBA finals
summary_table <- function(df) {
  tab <- df %>%
    group_by(Year) %>%
    summarise(
      fg_percentage = sum(FG, na.rm = TRUE) / sum(FGA, na.rm = TRUE),
      fg_attempted = sum(FGA, na.rm = TRUE),
      fg_total_points = sum(FG, na.rm = TRUE) * 2,
      ft_percentage = sum(FT, na.rm = TRUE) / sum(FTA, na.rm = TRUE),
      ft_attempted = sum(FTA, na.rm = TRUE),
      ft_total_points = sum(FT, na.rm = TRUE),
      tp_percentage = sum(TP, na.rm = TRUE) / sum(TPA, na.rm = TRUE),
      tp_attempted = sum(TPA, na.rm = TRUE),
      tp_total_points = sum(TP, na.rm = TRUE) * 3
    )
  return(tab)
}
