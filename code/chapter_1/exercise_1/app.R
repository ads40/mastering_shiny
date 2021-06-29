
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Chapter 1 Exercise 1"),
    
    # user input
    textInput("name", "What's your name?", value = NA),
    numericInput("age", "How old are you?", value = NA),

    textOutput("greeting")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$greeting <- renderText({
        paste0("Hello ", input$name, ". Your age is ", input$age, ".")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
