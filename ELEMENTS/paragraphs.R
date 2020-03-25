
# libraries ---------------------------------------------------------------
library(shiny)


# UI ----------------------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("This is a title"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h1('This is the sidebar')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h4('This is the main panel'),
            p('hello im writing text here, so you can try it too. Welcome to my lesson. hello'),
            p('Im creating a new paragraph'),
            code('coding style'), 
            br(), #space separator
            strong('text'), #bold text
            p("A new p() command starts a new paragraph", style = "font-family: 'times'; font-si16pt"), #changing font
            p('Changing colour', style = "color:red") #changing color font
        )
    )
)


# Server ------------------------------------------------------------------
server <- function(input, output) {

}


# Run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
