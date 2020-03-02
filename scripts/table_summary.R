library(dplyr)
styler::style_file("table_summary.R")
lintr::lint("table_summary.R")

table_function <- function(dataframe, year1, year2, year3, year4, year5, year6,
                           year7, year8, year9) {
  table <- dataframe %>%
    select(Year, Team, TPA, TP) %>%
    group_by(Year) %>%
    summarise(
      sum_tpa = sum(TPA),
      sum_tp = sum(TP),
      tpp = round((sum_tp / sum_tpa), digits = 2) * 100,
    ) %>%
    filter(
      Year == year1 |
        Year == year2 |
        Year == year3 |
        Year == year4 |
        Year == year5 |
        Year == year6 |
        Year == year7 |
        Year == year8 |
        Year == year9
    )
  return(table)
}
