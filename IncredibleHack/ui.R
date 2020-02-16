#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(DT)
library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("IncredibleHack"),
    sidebarLayout(
    sidebarPanel(
        width = 2,
        h2("x coefficients"),
        numericInput("x1",
                     h3("x1"),
                     value = 0.717),
        
        numericInput("x2",
                     h3("x2"),
                     value = 0.847),
        
        numericInput("x3",
                     h3("x3"),
                     value = 0.420),
        
        numericInput("x4", 
                     h3("x4"),
                     value = 3.107), 
       
        numericInput("x5", 
                     h3("x5"), 
                     value = 0.998),
        numericInput("threshold", 
                     h3("Threshold"), 
                     value = 2.5),
        verbatimTextOutput("result")
    ),

        mainPanel(
            width = 9,
            DT::dataTableOutput("mytable")
    )
    )
))
