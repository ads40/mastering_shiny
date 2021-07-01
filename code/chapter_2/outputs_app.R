library(shiny)

ui <- fluidPage(
  textOutput("text"),         # goes with renderText()
  verbatimTextOutput("code"), # goes with renderPrint()
  
  # static table of data, all at once
  tableOutput("static"),      # goes with renderTable()
  # dynamic table, with controls
  dataTableOutput("dynamic"), # goes with renderDataTable()
  
  # R graphics
  plotOutput("plot", width = "400px")
)

server <- function(input, output, session) {
  # like the difference between cat() and print() in base R
  output$text <- renderText("Hello, friend!")
  output$code <- renderPrint(summary(1:10))
  
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
  
  output$plot <- renderPlot(plot(1:10), res = 96)

}

shinyApp(ui, server)