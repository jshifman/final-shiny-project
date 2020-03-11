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
    which wasn't added to the game until 1979. Today 3-pt shots are such an icon,
    it's hard to imagine the NBA without it. In this project we explore how
    players started taking an advantage of the new addition to the game, when
    they started becoming more skilled with these shots, and how
    the chance to score 3pts rather than 1 or 2 changed the scoring of the game
    overall. The data sets that we will be using are: a shot log from the
    2014-2015 season and statistics on the individual games for both teams 
    playing in the NBA finals from 1980 to 2018 (two seperate datasets). The
    data for this research comes from:"),
    a("Champions Data", href = "https://www.kaggle.com/daverosenman/nba-finals-team-stats"),
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
  p("This chart shows the total number of shots taken of each type for each year 
    of the NBA Finals. Each total is a combination of both the champions and the 
    runner-ups. Over time, a greater percent of shots came from three pointers.")
)

interactive1 <- tabPanel(
  "Finals by Shot",
  titlePanel("Total NBA Finals scoring Distripution"),
    sidebarLayout(
      interactive1_sidebar,
      interactive1_main
      )
)

#2nd Inteactive Tab
interactive2_sidebar <- sidebarPanel(
  
)

interactive2_main <- mainPanel(
  
)

interactive2 <- tabPanel(
  "Tab 2 Name",
  titlePanel("Title Panel Name"),
  sidebarLayout(
    interactive2_sidebar,
    interactive2_main
  )
)

#3rd Interactive Tab
interactive3_sidebar <- sidebarPanel(
  
)

interactive3_main <- mainPanel(
  
)

interactive3 <- tabPanel(
  "Tab 3 Name",
  titlePanel("Title Panel Name"),
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
    p("A description of the notable data-insight or pattern discovered in your project:
        A specific piece of data, table, or chart that demonstrates the pattern/insight:
        The broader implications of the insight:"),
    h2("Takeaway 2"),
    p("A description of the notable data-insight or pattern discovered in your project:
        A specific piece of data, table, or chart that demonstrates the pattern/insight:
        The broader implications of the insight:"),
    h2("Takeaway 3"),
    p("A description of the notable data-insight or pattern discovered in your project:
        A specific piece of data, table, or chart that demonstrates the pattern/insight:
        The broader implications of the insight:")
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
