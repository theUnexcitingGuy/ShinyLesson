# link to all control widgets: https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/

# libraries  --------------------------------------------------------------
library(shiny)

# user interface side -----------------------------------------------------
ui <- fluidPage(
    
    # Sidebar with a slider input
    sidebarLayout(
        sidebarPanel(
            sliderInput("ciao",
                        "Ciao:",
                        min = 1,
                        max = 50,
                        value = 50, 
                        step = 10),
            selectInput('hell', 'Yes', c('Yes', 'No'))
        ),

        # Main panel area
        mainPanel()
    )
)


# Server side -------------------------------------------------------------
server <- function(input, output) {}


# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
