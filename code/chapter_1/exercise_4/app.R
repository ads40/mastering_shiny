
library(shiny)

ui <- fluidPage(

    # Application title
    titlePanel("Chapter 1 Exercise 4"),
    
    sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),

    sliderInput("y", label = "and y is", min = 1, max = 50, value = 5),
    "then (x * y) is", textOutput("product"),
    "then (x * y) + 5 is", textOutput("product_plus5"),
    "then (x * y) + 10 is", textOutput("product_plus10"),
    
)

server <- function(input, output) {
    
    product <- reactive({
        input$x * input$y
    })
    
    output$product <- renderText({
        product()
    })
    
    output$product_plus5 <- renderText({
        product() + 5
    })
    
    output$product_plus10 <- renderText({
        product() + 10
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
