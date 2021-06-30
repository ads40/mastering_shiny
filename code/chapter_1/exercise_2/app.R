
library(shiny)

ui <- fluidPage(

    # Application title
    titlePanel("Chapter 1 Exercise 2"),
    
    sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
    "then x times 5 is",
    textOutput("product")
    
)

server <- function(input, output) {
    output$product <- renderText({
        input$x * 5
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
