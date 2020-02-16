#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
        # generate bins based on input$bins from ui.R
        sampleData  <- read.csv("~/IncredibleHack/Data/data_set.csv")
        
        output$mytable = DT::renderDataTable({
            DT::datatable( sampleData,, selection = 'single', filter = "top", options = list(
                initComplete = JS(
                    "function(settings, json) {",
                    "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                    "}"),
                orderClasses = TRUE,searchHighlight = TRUE))
        })
        output$result = renderPrint({
            s = input$mytable_rows_selected
            if (length(s)) {
                cat('x1: ')
                cat(sampleData[s,]$x1)
                cat('\n')
                cat('x2: ')
                cat(sampleData[s,]$x2)
                cat('\n')
                cat('x3: ')
                cat(sampleData[s,]$x3)
                cat('\n')
                cat('x4: ')
                cat(sampleData[s,]$x4)
                cat('\n')
                cat('x5: ')
                cat(sampleData[s,]$x5)
                cat('\n')
                res = input$x1 * sampleData[s,]$x1 + 
                    input$x2 * sampleData[s,]$x2 + 
                    input$x3 * sampleData[s,]$x3 + 
                    input$x4 * sampleData[s,]$x4 +
                    input$x5 * sampleData[s,]$x5
                cat(res)
                cat('\n')
                cat("Result: ")
                if(res>input$threshold)
                    cat("Loan!")
                else
                    cat("No Loan")
            }
        })
})
