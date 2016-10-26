
library(shiny)

shinyServer(function(input, output) {
        output$BMI <- renderText({
                BMI <- round((input$weight / ((input$height / 100)^2)),2)
                paste("Your BMI : ",BMI, " Kg/m2")})

        output$BMIcategory <- renderText({
                BMI <- round((input$weight / ((input$height / 100)^2)),2)
                if(BMI < 16.00) {category <- ("Severe Thinness")}
                if(16.00 <= BMI & BMI <= 16.99) {category <- ("Moderate thinness")}
                if(17.00 <= BMI & BMI <= 18.49) {category <- ("Mild thinness")}
                if(18.50 <= BMI & BMI <= 24.99) {category <- ("Normal range")}
                if(25.00 <= BMI & BMI <= 29.99) {category <- ("Pre-obese")}
                if(30.00 <= BMI & BMI <= 34.99) {category <- ("Obese class I")}
                if(35.00 <= BMI & BMI <= 39.99) {category <- ("Obese class II")}
                if(BMI >= 40.00) {category <- ("Obese Class III")}            
                paste("Your BMI Category : ",category)})
        
        output$sweight <- renderText({paste("Your Weight : ", input$weight," Kg.")})        
        
        output$minweight <- renderText({
                minw <- round((18.5 * ((input$height / 100)^2)),2)
                paste("Minimun Suggested Weight : ", minw," Kg.")})        
        
        output$maxweight <- renderText({
                maxw <- round((24.99 * ((input$height / 100)^2)),2)
                paste("Maximun Suggested Weight:", maxw," Kg.")})        

        output$sheight <- renderText({
                paste("Your Current Height: ",input$height," cm.")})
        
        })