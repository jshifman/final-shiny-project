library(shiny)
library(ggplot2)
library(plotly)

# Intro
intro <- tabPanel(
  "Introduction to Project",
  fluidPage(
    h1("Scoring In Basketball"),
    h2("An analysis on 3-point Shots Over the Years"),
    img("", src = "https://media.giphy.com/media/l0HlElVOyhuWfizq8/giphy.gif"),
    p("The National Basketball Assoication (NBA) has been around for almost 75
    years and over the years the game of basketball has changed in my ways. The
    names of teams have changed, the uniforms have changed, and even the way
    the game is played. For our project, we wanted to focus on the gameplay
    patterns and stats that have stayed consistent and that have changed.
    Specfically, our project will be mainly focusing on the 3 point feild goal,
    which wasn't added to the game until 1979. Today 3-pt shots are such an
    iconic, it's hard to imagine the NBA without it. In this project we explore
    how players started taking an advantage of the new addition to the game,
    when they started becoming more skilled with these shots, and how
    the chance to score 3pts rather than 1pt or 2pts changed the scoring of
    the game overall. The data sets that we will be using are: a shot log from
    the 2014-2015 season and statistics on the individual games for both teams
    playing in the NBA finals from 1980 to 2018 (two seperate datasets). The
    data for this research comes from:"),
    a("Champions Data",
      href = "https://www.kaggle.com/daverosenman/nba-finals-team-stats"),
    p("and"),
    a("Shot Logs", href = "https://www.kaggle.com/dansbecker/nba-shot-logs")
  )
)

# 1st Interactive Tab
interactive1_sidebar <- sidebarPanel(
  final_year <- sliderInput(
    "final_year",
    label = "NBA Finals Year (1980-2018)",
    min = 1980,
    max = 2018,
    value = 1980
  )
)

interactive1_main <- mainPanel(
  plotlyOutput("pie"),
  p("This chart shows the total number of shots taken of each type for each
  year of the NBA Finals. Each total is a combination of both the champions
  and the runner-ups. Over time, a greater percent of shots came from three
  pointers.")
)

interactive1 <- tabPanel(
  "Finals by Shot",
  titlePanel("Total NBA Finals Scoring Distripution"),
    sidebarLayout(
      interactive1_sidebar,
      interactive1_main
      )
)

#2nd Inteactive Tab
interactive2_sidebar <- sidebarPanel(
  final_year <- sliderInput(
    "picked_year",
    label = "NBA Finals Year (1980-2018)",
    min = 1980,
    max = 2018,
    value = 1980
  )
)

interactive2_main <- mainPanel(
  plotlyOutput("bar")
)

interactive2 <- tabPanel(
  "Defensive Rebounding",
  titlePanel("Total Defensive Rebounds Over the Years"),
  sidebarLayout(
    interactive2_sidebar,
    interactive2_main
  )
)

#3rd Interactive Tab
interactive3_sidebar <- sidebarPanel(
  sliderInput(
    inputId = "chosen_year",
    label = h3("The Year"),
    min = 1980,
    max = 2018,
    value = 1980
  )
)

interactive3_main <- mainPanel(
  plotOutput(outputId = "scatterplot")
)

interactive3 <- tabPanel(
  "Assists vs. Points in the NBA Finals",
  titlePanel("Assists vs. Points"),
  sidebarLayout(
    interactive3_sidebar,
    interactive3_main
  )
)

#Takeaways
takeaways <- tabPanel(
  "Takeaways",
  fluidPage(
    h1("What We Learned From This Project"),
    h2("Takeaway 1"),
    p("Based on the Total NBA Finals scoring Distripution chart, there is a
    pattern that was the year of the NBA Final increases, so does the
    percentage of shots that were 3 pointers. In 1980 the total percentage was
    only 0.0133%, which by 2000 jumped to 10.4%, and by 2018 3 point shots made
    up 16% of all NBA Final shots. A broader implication of this insight how
    coaches should train their players. In 1980, if your team wasn't
    very skilled at 3 point shots, it wouldn't effect you odds of winning at
    all. No one could make 3 pointers and no one was even attempting to make
    them.However, today if a team doesn't frequently make 3 point shots, it
    puts them at a great disadvantage because other teams rely on them. By
    knowing how common 3 pointers are, this allows coaches to get a sense on
    where there team falls in comparsion to the rest of the league and
    determine how much time and effort should be put to improving the shot."),
    h2("Takeaway 2"),
    p("Contrary to offensive trends throughout the years, which have seen a
    steady increase in farther shots taken and subsequently more made three's,
    the defensive rebounding data highlights no such change. This shows how
    defensive tendencies have more or less remained consistent through the
    years, regardless of changes in playstyle.In accordance with this finding,
    the data points from the years 1980, 2000, and 2016 highlight this
    steadfast and unchanging defensive stat. These data points were chosen
    because they are spaced throughout the range and they each were years with
    a championship series with 6 games. In 1980 there was a total of 371
    defensive rebounds between both teams while in 2000, twenty years later,
    there were a total of 370 defensive rebounds. Additionally, after another
    15 years, in 2015, there were a total of 412 defensive rebounds. These
    numbers highlight the near perfect consistent amount of defensive rebounds
    across a championship series of 6 games, regardless of the year. The
    broader implication of this finding extends to the NBA, and how perhaps a
    culture within the league has pushed the evolution of offense to one of
    greater lengths, all while seemingly ignoring the timeless and steadfast
    strategies teams employ for defense. This culture, according to the data,
    has valued the development of offense over defense
    for the past 40 years."),
    h2("Takeaway 3"),
    p("From looking at the Assists vs. Points in the NBA Finals scatterplot,
    one can see that in most of the years, there was the expected linear
    relationship between points and assists. it makes sense that as a team
    gets more and more assists, they will score more because each assist leads
    to a basket for that team. For example, the years 1981 and 1982 show that
    there is a clear upward trend between points and assists. This also shows
    how this relationship is generational and how it has not been affected by
    time because from 2014 to 2018, the same trend is seen. One implication
    gathered from this scatterplot is that if teams want to win games, they
    have to be able to pass the ball around and get assists. A player
    is credited with an assist if the player passes the ball directly
    to another teammate and the teammate scores the ball directly after.
    Assists are a huge component in the game, and can say a lot about
    how your team is playing. If your team as a whole is getting a lot
    of assists, it means your team is passing the ball well and usually
    moving it from side to side to get more open shots.")
  )
)

ui <- navbarPage(
  "Back Team Final Project",
  intro,
  interactive1,
  interactive2,
  interactive3,
  takeaways
  )
