
# libraries ---------------------------------------------------------------
library(shiny)


# UI side -----------------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Check box group test"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            #insert checkbox group, you can select more than one option
            checkboxGroupInput("checkGroup", 
                               h3("Checkbox group"), 
                               choices = list("Choice 1" = 1, 
                                              "Choice 2" = 2, 
                                              "Choice 3" = 3),
                               selected = 1) #selected = 1 means the choice  is pre selected
        ),

        # main panel
        mainPanel(
        )
    )
)


# server side -------------------------------------------------------------
server <- function(input, output) {
}


# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
