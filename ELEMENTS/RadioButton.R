
# libraries ---------------------------------------------------------------
library(shiny)

# Define UI side ---------------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Radio Buttons test"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            #placing the radio button with id = 'radio', YOU CAN ONLY CHOOSE ONE ELEMENT
            radioButtons("radio", h3("Radio buttons"),
                         c("Choice 1" = 1, "Choice 2" = 2,
                                        "Choice 3" = 3), selected = 1) #selected = 1 means that the first choice is auotomatically selected
        ),

        # Show a plot of the generated distribution
        mainPanel()
    )
)

# Define server logic ---------------------------------------------------------------
server <- function(input, output) {
}

# Run the application ---------------------------------------------------------------
shinyApp(ui = ui, server = server)
