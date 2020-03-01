library(dplyr)
library(lintr)
styler::style_file("summary_info.R")
lintr::lint("summary_info.R")

# 3-pointer stats:
# TP - 3 point fields made, TPA - 3 point attempts, TPP - 3 point percentage
# TP & TPA from the NBA championship for given year & Average # pts a team
# scored in a single round of the NBA championship

tpa_tp_pts <- function(champs, runnerup, year1, year2) {
  ret <- list()
  tpa_champs <- champs %>%
    select(Year, TPA) %>%
    filter(Year == year1) %>%
    select(TPA) %>%
    summarise(total = sum(TPA)) %>%
    pull()
  tpa_runnerups <- runnerup %>%
    select(Year, TPA) %>%
    filter(Year == year1) %>%
    select(TPA) %>%
    summarise(total = sum(TPA)) %>%
    pull()
  ret$tpa <- tpa_champs + tpa_runnerups
  tp_champs <- champs %>%
    select(Year, TP) %>%
    filter(Year == year1) %>%
    select(TP) %>%
    summarise(total = sum(TP)) %>%
    pull()
  tp_runnerups <- runnerup %>%
    select(Year, TP) %>%
    filter(Year == year1) %>%
    select(TP) %>%
    summarise(total = sum(TP)) %>%
    pull()
  ret$tp <- tp_champs + tp_runnerups

  pts_champs_total <- champs %>%
    select(Year, PTS) %>%
    filter(Year >= year1 & Year <= year2) %>%
    summarise(sum(PTS)) %>%
    pull()
  pts_champs_rows <- champs %>%
    select(Year, PTS) %>%
    filter(Year >= year1 & Year <= year2) %>%
    nrow()
  pts_runnerups_total <- runnerup %>%
    select(Year, PTS) %>%
    filter(Year >= year1 & Year <= year2) %>%
    summarise(sum(PTS)) %>%
    pull()
  pts_runnerups_rows <- runnerup %>%
    select(Year, PTS) %>%
    filter(Year >= year1 & Year <= year2) %>%
    nrow()
  ret$pts <- round(
    ((pts_champs_total / pts_champs_rows) +
      (pts_runnerups_total / pts_runnerups_rows))
    / 2,
    digits = 0
  )

  return(ret)
}
