#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# setwd("~/Learning Books/Data Science/Coursera DataScience/C9 Data Products/Final Project C9/myC9shinyapp")

# library(shiny)

shinyServer(function(input, output) {
  model <- reactive({
    brushed_data <- brushedPoints(mtcars, input$brush1,
                                  xvar = "wt", yvar = "mpg")
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    lm(mpg ~ wt, data = brushed_data)
  })
  output$slopeOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][2]
    }
  })
  output$intOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][1]
    }
  })
  output$plot1 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg, xlab = "Weight (tons)",
         ylab = "Miles per Gallon", main = "Fuel Effiiciency",
         cex = 1.5, pch = 16, col="red", bty = "n")
    if(!is.null(model())){
      abline(model(), col = "blue", lwd = 2)
    }
  })
})
