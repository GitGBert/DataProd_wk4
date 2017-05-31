#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# setwd("~/Learning Books/Data Science/Coursera DataScience/C9 Data Products/Final Project C9/myC9shinyapp")

#library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Graphic Best Fit Model"),
  h3("Drag a box around the points you wish to include for best fit"),
  sidebarLayout(
    sidebarPanel(
      h3("Slope"),
      textOutput("slopeOut"),
      h3("Intercept"),
      textOutput("intOut"),
      h3("The above is the line slope and intercept of your chosen data")
    ),
    
    # show plot of xxx
    mainPanel(
      plotOutput("plot1", brush = brushOpts(
        id = "brush1"
      ))
    )
  )
))

