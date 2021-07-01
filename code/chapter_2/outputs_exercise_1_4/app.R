library(shiny)

ui <- fluidPage(
  
  # Exercise 1
  verbatimTextOutput("mtcars"),
  textOutput("greeting"),
  verbatimTextOutput("ttest"),
  verbatimTextOutput("model"),
  
  # Exercise 2
  plotOutput("plot", width = "700px", height = "300px"),
  
  # Exercise 3-4
  dataTableOutput("table")
)

server <- function(input, output, session) {
  
  # Exercise 1
  output$mtcars <- renderPrint(summary(mtcars))
  output$greeting <- renderText("Good morning!")
  output$ttest <- renderPrint(t.test(1:5, 2:6))
  output$model <- renderPrint(str(lm(mpg ~ wt, data = mtcars))) # change to renderPrint()
  
  # Exercise 2
  output$plot <- renderPlot(plot(1:5), res = 96, alt = "Scatterplot of the numbers 1 to 5")
  
  # Exercise 3-4
  output$table <- renderDataTable(
    mtcars, options = list(         # https://datatables.net/reference/option/
      pageLength = 5,
      searching = FALSE,
      ordering = FALSE
      )
    )
  
}

shinyApp(ui, server)