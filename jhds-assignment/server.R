#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Created by Ben de Haan

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    library(caret)
    library(randomForest)
    trc <- trainControl(method="boot")
    
    rf <- train(Ozone~., 
                data=na.omit(airquality), 
                method='rf', 
                metric="RMSE",
                trControl=trc)
    
    output$ozone <- renderText({
        solar <- input$solar
        wind <- input$wind
        temp <- input$temp
        month <- input$month
        day <- input$day
        df <- data.frame(solar, wind, temp, month, day)
        print(df)
        colnames(df) <- c('Solar.R', 'Wind', 'Temp', 'Month', 'Day')
        predict(rf, df)
    })

})
