
# libraries ---------------------------------------------------------------
library(shiny)


# user interface ----------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Button test"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            #insert a button
            actionButton("button", "Click"),
            actionButton('id', 'Click2')
        ),

        # Show a plot of the generated distribution
        mainPanel()
    )
)




# server side -------------------------------------------------------------
server <- function(input, output) {}


# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
