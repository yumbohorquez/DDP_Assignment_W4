library(shiny)

# Define UI for application that draws the plot
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict COVID-19 deaths of UCI patients"),
    
    # Sidebar with a slider input for COVID-19 UCI patients
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderUCI","What is the UCI patient Qty?", min = 0, max =35, value = 15),
            submitButton("Submit"),
            h6("Quick Guide:
               Enter the quantity of COVID-19 UCI patients
               Click on Submit button")
        ),
        
        # Bring the plot to the life
        mainPanel(
            plotOutput("plot1"),
            h4("Prediction:  Potential deaths (Blue Point):"),
            textOutput("pred1")
        )
    )
))