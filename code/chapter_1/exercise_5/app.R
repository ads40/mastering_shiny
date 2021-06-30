
library(ggplot2)
library(shiny)

datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(

    # Application title
    titlePanel("Chapter 1 Exercise 5"),
    
    selectInput("dataset", label = "Dataset", choices = datasets),
    verbatimTextOutput("summary"),
    plotOutput("plot") # change to plotOutput() instead of tableOutput()

)

server <- function(input, output) {

    dataset <- reactive({
        get(input$dataset, "package:ggplot2")
    })
    
    output$summary <- renderPrint({
        summary(dataset())
    })
    
    output$plot <- renderPlot({
        plot(dataset()) # change to dataset() instead of dataset
    }, res = 96)
}

# Run the application 
shinyApp(ui = ui, server = server)


# Where is the third error?

# From the book source (https://github.com/hadley/mastering-shiny/blob/master/basic-app.Rmd), 
# it appears that the third error is a misspelled "summmry" in the server function:
#
# output$summmry <- renderPrint({
#     summary(dataset())
# })
#
# Perhaps this was corrected in the book manuscript by accident. Erratum submitted 2021-06-30.
