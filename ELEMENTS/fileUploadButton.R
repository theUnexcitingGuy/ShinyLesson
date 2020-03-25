
# libraries ---------------------------------------------------------------
library(shiny)


# UI logic ----------------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("File upload test"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            #upload file widget
            fileInput("file", h3("File input")) #add width = 300 for instance to make the panel bigger
        ),

        # Show a plot of the generated distribution
        mainPanel(
        )
    )
)


# server logic ------------------------------------------------------------
server <- function(input, output) {
}


# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
