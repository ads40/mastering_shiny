library(shiny)

# the ui object contains the HTML presented to the client; this is the same for all clients
# of the application

ui <- fluidPage(
  textInput("name", "Enter your name here:"),
  textOutput("greeting")
)

# the server function encapsulated the behaviour and state of the app; while the functionality
# is the same for all users, the state must be different; accordingly, Shiny calls the server
# function afresh for each session connected to the application, and thereby creates an
# independent environment for each connected session

# three arguments: input, output and session, all created by Shiny
# input is list-like, and can only be read from a reactive context, e.g. renderText() or reactive()
# output is list-like, and must be paired with a render function

# Shiny involves declarative programming and uses R's laziness as a particular virtue
# the order of the code does not determine the order of execution: the reactive graph is the key
# here instead

server <- function(input, output, session) {
  string <- reactive(paste("Hello,", input$name, "! This", "is", "basic", "reactivity in action"))
  
  output$greeting <- renderText(string())
}

shinyApp(ui, server)