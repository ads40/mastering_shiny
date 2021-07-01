################################################################################################
#
# App + notes for Chapter 2 of Mastering Shiny
#
################################################################################################

library(shiny)

# Focus is on builtin inputs and outputs in Shiny, but lots of extensions are available:
# 
# - shinyWidgets: https://dreamrs.github.io/shinyWidgets/index.html
# - colourpicker: https://deanattali.com/blog/colourpicker-package/
# - sortable: https://rstudio.github.io/sortable/
# 
# See also Nan Xiao's curated list: https://github.com/nanxstats/awesome-shiny-extensions

animals <- c("Zebra", "Hippo", "Meerkat", "Lion", "Dung Beetle")
states <- c("NSW", "SA", "VIC", "WA", "QLD", "TAS", "NT", "ACT")

ui <- fluidPage(

    # Application title
    titlePanel("Basic UI elements"),
    
    # basic text input
    textInput("name", "What's your name?"),
    passwordInput("password", "What's your password?"), # only obscures typed text
    textAreaInput("story", "Tell me a story", rows = 4),
    
    # basic numeric inputs
    numericInput("num", "Number One", value = 0, min = 0, max = 100),
    sliderInput("num2", "Number Two", value = 0, min = 0, max = 100),
    sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100), # supply a length-2 vector
    # for more on sliders see `?sliderInput` and https://shiny.rstudio.com/articles/sliders.html

    # date input
    dateInput("dob", "When were you born?"),
    dateRangeInput("holidays", "Pick your holiday dates."),
    
    # limited choices
    selectInput("state", "What's your favourite state?", choices = states),
    radioButtons("animal", "What's your favourite animal?", choices = animals),
    radioButtons("emote", "Choose one:",
                 choiceNames = list(
                     icon("angry"),
                     icon("smile"),
                     icon("sad-tear")
                     ),
                 choiceValues = list("angry", "happy", "sad")
                 ),
    # allow multiple choices
    selectInput("state", "What's your favourite (dropdown) state", choices = states,
                multiple = TRUE),
    # allow multiple choices in a layout similar to radioButtons
    checkboxGroupInput("animal", "Pick an animal", animals),

    # for all these elements, consult the documentation under "Server value" to check what is
    # passed to the server function via the `input` object
    
    # upload a file: see Chapter 9 for detailed discussion
    fileInput("upload", NULL),
    
    # action buttons
    actionButton("click", "Click me!"),
    actionButton("drink", "Drink me!", icon = icon("cocktail")),
    # pair actionButtons with observeEvent() or eventReactive()
    # use Bootstrap classes to customise the appearance: see http://bootstrapdocs.com/
    actionButton("drink1", "No, drink me!", icon = icon("cocktail"), class = "btn-danger")
    
)

server <- function(input, output) {

}

shinyApp(ui = ui, server = server)
