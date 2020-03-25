
# libraries ---------------------------------------------------------------
library(shiny)

# Define UI side ----------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Test select input"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            #firs type of selectInput
            selectInput('id', 'Label', c('Yes', 'No', 'Gianlu', 'Vito')),
            
            #second type of selectInput with no default selection
            selectInput('id1', 'label2', c('NULL', 'Yes', 'No'), selected = NULL),
        ),

        # Show a plot of the generated distribution
        mainPanel()
    )
)


# Define server side ------------------------------------------------------
server <- function(input, output) {}


# Run the application -----------------------------------------------------
shinyApp(ui = ui, server = server)
