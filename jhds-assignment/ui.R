#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Created by Ben de Haan

library(shiny)

# Define UI for application that predicts ozone based on the input
shinyUI(fluidPage(

    # Application title
    titlePanel("New York Ozone concentration prediction"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("solar",
                        "Solar Radiation:",
                        min = 0,
                        max = 400,
                        value = 200),
            sliderInput("wind",
                        "Wind speed (mph):",
                        min = 0,
                        max = 40,
                        value = 20),
            sliderInput("temp",
                        "Temperature (Fahrenheit):",
                        min = 0,
                        max = 100,
                        value = 60),
            sliderInput("month",
                        "Month:",
                        min = 1,
                        max = 12,
                        value = 6),
            sliderInput("day",
                        "Day:",
                        min = 1,
                        max = 31,
                        value = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h2("Expected Ozone concentration (ppb):"),
            h3(textOutput("ozone"))
        )
    )
))
