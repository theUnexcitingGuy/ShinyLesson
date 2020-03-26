#DURING THE LESSON SHOW GGPLOTLY TO MAKE THE PLOT INTERACTIVE

# libraries ---------------------------------------------------------------
library(shiny)
library(tidyverse)
library(plotly) #library needed to make the plot interactive

# user interface ----------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Display a simple plot"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          h4('sidebar')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            #code to display plot with id = 'testPlot'
            plotOutput("testPlot"),
        )
    )
)


# server side -------------------------------------------------------------
server <- function(input, output) {
  
    output$testPlot <- renderPlot({
        ggplot(data = head(diamonds, 100), aes(x = depth, y = price, color = color)) +
            geom_point() 
    })
}

#these are the lines to create an interactive ggplot, substitute the lines above with the lines below
# ggplotly(
#     ggplot(data = head(diamonds, 100), aes(x = depth, y = price, color = color)) +
#         geom_point() 
# )

# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
