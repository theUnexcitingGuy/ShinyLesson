
# libraries ---------------------------------------------------------------
library(shiny)
library(DT) #package needed to display dataframes in a cool way
library(tidyverse) #contains the dataframe diamonds for testing
library(dplyr) #to manipulate the dataframe to display


# UI side -----------------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Displaying a table"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h3('Test --> ')
        ),

        # Display the tabel on the right
        mainPanel(
           DTOutput("data")
        )
    )
)

# Define server logic to display the table
server <- function(input, output) {
    #the code always starts with output$id <- rendertype({})
    output$data <- renderDT({
        #diamonds #name of the table
        
        #OR you could show only the first rows
        # head(diamonds, 5)
        
        #OR you could specify certain columns to show
        diamonds %>% 
            select(cut, color, clarity)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
