
library(shiny)

ui <- fluidPage(

    # Application title
    titlePanel("Chapter 1 Exercise 3"),
    
    sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),

    sliderInput("y", label = "and y is", min = 1, max = 50, value = 30),
    "then x times y is",
    textOutput("product")
    
)

server <- function(input, output) {
    output$product <- renderText({
        input$x * input$y
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
