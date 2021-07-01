# Chapter 2 Inputs Exercises 1-4

# set the label to an empty string, and use the `placeholder` argument

library(shiny)

states_aus <- list(
  `States` = list("NSW", "Queensland", "South Australia", "Tasmania", "Western Australia"),
  `Internal Territories` = list("ACT", "Jervis Territory", "Northern Territory"),
  `External Territories` = list("Ashmore and Cartier Islands", "Australian Antarctic Territory",
                             "Christmas Island", "Cocos (Keeling) Islands", "Coral Sea Islands",
                             "Heard Island and McDonald Islands"),
  `Autonomous Territory` = list("Norfolk Island")
)


ui <- fluidPage(
  
  # Exercise 1
  # set the label to an empty string, and use the `placeholder` argument
  textInput("example", label = "", placeholder = "Your name"),
  
  # Exercise 2
  # set the value (and associated arguments) to a Date object
  sliderInput("delivery_date", "When should we deliver?", 
              min = Sys.Date(), max = Sys.Date() + 7, value = Sys.Date() + 1),
  
  # Exercise 3
  # use the arguments for sliderInput
  sliderInput("animated", "Animated slider", 
              min = 0, max = 100, value = 0,
              step = 5, animate = TRUE),
  
  # Exercise 4
  # construct a named list that contains sub-lists as the choices argument
  selectInput("states_and_territories", "List with subgroups", choices = states_aus)
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)