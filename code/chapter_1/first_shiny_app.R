# Mastering Shiny Chapter 1 "Your First Shiny App"

library(shiny)

# define the user interface in the ui() function
# ui <- fluidPage(
#   "Hello, world! I really mean it!!"
# )

ui <- fluidPage(
  # fluidPage() is a layout function: basic structure of page
  # selectInput() is an input control
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  # verbatimTextOutput() and tableOutput() are output controls
  verbatimTextOutput("summary"),
  tableOutput("table")
)

# define the app's behaviour in the server() function
server <- function(input, output, session) {
  
  # avoid duplicated code by using reactive expressions rather than a regular variable or function:
  # regular variables won't work, and functions don't cache, but reactive expressions will be smart
  # about caching

  dataset <- reactive({
    # base::get looks up the value for a name in the supplied environment
    get(input$dataset, "package:datasets")
  })
  
  # define _how_ Shiny should respond whenever required (reactivity)
  # use a particular render function for the type of output
  
  output$summary <- renderPrint({
    summary(dataset()) # call a reactive expression like a function
  })
  
  output$table <- renderTable({
    dataset()
  })
  
}

shinyApp(ui, server)
