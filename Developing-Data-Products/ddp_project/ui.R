
library(shiny)

# ui.R

shinyUI(fluidPage(
        titlePanel("Sample Data App:  Body Mass Index Calculator "),
        sidebarLayout(position = "right",
                sidebarPanel(h4("Your BMI:"),
                             br(),
                             textOutput("BMI"),
                             br(),
                             textOutput("BMIcategory"),
                             br(),
                             textOutput("sweight"),
                             br(),
                             textOutput("maxweight"),
                             br(),
                             textOutput("minweight"),
                             br(),
                             textOutput("sheight"),
                             br()
                             ),
                mainPanel(
                  
                    
                        h4("About BMI.", aling = "center"),        
                        div("Body Mass Index (BMI) is a person's weight in kilograms divided by the square of height in meters."),
                        div("A high BMI can be an indicator of high body fatness."),
                        div("BMI can be used to screen for weight categories that may lead to health problems but it is not diagnostic of the body fatness or health of an individual."),
                        br(),
                        
                        h4("About this Application.", aling = "center"),        
                        div("This App is designed to calculate your BMI and give you a classification category. "),
                        div("To use the app please select your height and weigth below and make clic on the 'Calculate your BMI' button"),
                        br(),
                        
                        h4("Input Data.", aling = "center"),        
                        sliderInput("height", label = h5("Height in Centimeters"),min = 50, max = 250, value = 178, step = 1, width = "150%", animate = TRUE),
                        br(),
                        sliderInput("weight", label = h5("Weight in Kilograms"), min = 20, max = 500, value = 80, step = 0.1, width = "150%", animate = TRUE),
                        br(),
                        submitButton(h5("Calculate your BMI")),
                        br()
                        )
                    )
                )
        )
