
# libraries ---------------------------------------------------------------
library(shiny)


# data  -------------------------------------------------------------------
choices <- c('Baby', 'hello', 'bobby', 'Yes')


# Define UI side ----------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Selectize input test"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            #using selectize
            selectizeInput('id', 'Label', choices , selected = T, multiple = T), 
            
            # #create the same thing but with selectinput
            selectInput('id2', 'label2', choices, selectize = T, multiple = T),
            # 
            #see the difference with the options parameter
            selectizeInput('foo', 'Create one', c(''), options = list(create = TRUE)),  #lets you create new items to add to the list
            selectizeInput('foo1', 'Max options', choices, options = list(maxOptions = 2)), #lets you show only the first two elements of the list
            selectizeInput('foo2', 'Max selected items', choices, options = list(maxItems = 2)), #allow the selection of a maximum of two elements
            selectizeInput('foo3', 'Placeholder', choices, options = list(placeholder = 'Gianlu ciao'), multiple = T), #put 'type here' writing

            #combine options
            selectizeInput('foo5', 'Combined options', choices, options = list(maxItems = 2, create = TRUE))
            
        
        ),

        # Show a plot of the generated distribution
        mainPanel()
    )
)

# Define server side -------------------------------------------------------
server <- function(input, output) {
}

# Run the application ------------------------------------------------------
shinyApp(ui = ui, server = server)
