

# libraries ---------------------------------------------------------------
library(shiny)
library(DT) #to display the datatable
library(dplyr)
library(readxl)

# user interface side -----------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Upload and display baby"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            fileInput("file", h3("File input")), width = 5 #dimension of the sidebarpanel
        ),

        # Show a plot of the generated distribution
        mainPanel(
            DTOutput('data')
        )
    )
)


# server side -------------------------------------------------------------
server <- function(input, output) {
    
    #i decide to user renderTable, but i could have used renderDT too
    output$data <- renderDT({
        #first i assign the input file to a variable
        file1 <- input$file

        #if the user has uploaded a file then display it
        if (!is.null(file1)) {
            read_excel(file1$datapath) #I have to read the file as if I was importing it
        }
    })
}


# run the application -----------------------------------------------------
shinyApp(ui = ui, server = server)
