
# libraries ---------------------------------------------------------------
library(shiny)
library(tidyverse)
#library(plotly) #only if you want to create a plotly output
View(diamonds)
# UI side -----------------------------------------------------------------
ui <- fluidPage(

    # Application title
    titlePanel("Change the plot"),

    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            #x-axis input
            selectInput('x', 'Choose the x-axis', c('table', 'price' ,'carat')),
            
            #y-axis input
            selectInput('y', 'Choose the y-axis', c('table', 'price', 'carat')),
            
            #color option
            #selectInput('color', 'Coloring variable', c('NULL', 'color', 'cut', 'clarity'), selected = NULL)
        ),

        # Show a plot
        mainPanel(
           plotOutput("plot") #('id')
        )
    )
)


# server side -------------------------------------------------------------
server <- function(input, output) {
    output$plot <- renderPlot({
           ggplot(data = head(diamonds, 200), aes_string(x = input$x, y = input$y)) +
            geom_point()  #when passing variables we use 'aes_string' and NOT 'aes'
    })
}


# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
