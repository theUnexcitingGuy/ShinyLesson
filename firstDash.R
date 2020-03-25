
#links from which I took the codes for the plots: https://rpubs.com/ameilij/EDA_lesson3
#other link: https://r4ds.had.co.nz/data-visualisation.html


# libraries ---------------------------------------------------------------
library(shiny)
library(shinydashboard) 
library(tidyverse)
library(dplyr)
library(plotly)

# UI ----------------------------------------------------------------------
ui <- shinyUI(
    dashboardPage(skin = 'blue',
                  dashboardHeader(title = "Diamond Analytics"),
                  #sidebar
                  dashboardSidebar(
                      sidebarMenu(
                          menuItem("Overview",tabName = "sec1", icon = icon("eye")),
                          menuItem("In depth analytics", tabName = "sec2", icon = icon("chart-bar")) 
                      )
                  ),
                  
                  #body
                  dashboardBody(
                      tabItems(
                          #Overview section
                          tabItem(
                              tabName = 'sec1', 
                              h2(strong('The Dataset')), #strong gives a bold look to the text
                              fluidRow(box(p('The diamonds dataset is found within the R package tidyverse, and it contains 
                              data related to gems, such as price information, colour of the gems and much more. Below you
                                             can find some basic analyses which give an overview on the dataset' ), width = 12)), 
                              h3(strong('Cut analytics')),
                              fluidRow(
                                  box(plotOutput('cutanalytics')), 
                                  box(plotlyOutput('cutinteractive'))
                              ), 
                              fluidRow(
                                  box(p('The conclusions are not so clear, lets keep going on with the analyses'), width = 12)
                              ),
                              h3(strong('Carat analytics')), 
                              fluidRow(
                                  box(plotOutput('caratfreq')), 
                                  box(plotOutput('caratPlot2'))
                              )
                              
                          ), 
                          #In depth analysis
                          tabItem(
                              tabName = 'sec2', 
                              h2(strong('Create your own graph')),
                              #if you dont put FluidRow then the writing wont be aligned, PUT FLUIDROW
                              fluidRow(box(p('In this section you are able to create your own graph by simply 
                                    selecting below the axis of the graph so that you can analyse specific things. Go on! Give it a Try'), width = 12)), 
                              #fluidrow with buttons on the left and plot on the right
                              fluidRow(
                                  #controls on the left
                                  box(width = 5 ,p('You can select the variable to place on the two axis of the plot. In addition I have included to possibility
                                                   fo you to select a variable to use for the colouring of the data. For now, the coloring input ', code('NULL'), 'is autoselected.'),
                                      br(),
                                      selectInput('x', 'Select the x-axis', c('depth', 'table')), 
                                      selectInput('y', 'Select the y-axis', c('price', 'carat')),
                                      selectInput('color', 'Coloring variable', c('NULL','color', 'clarity'), selected = NULL)), 
                                  
                                  #plot on the right
                                  box(plotOutput('customPlot'), width = 7)
                              )
                          )
                      )
                  )
    )
)


# server side -------------------------------------------------------------
server <- function(input, output) {
    #custom plot 
    output$customPlot <- renderPlot({
        ggplot(data = diamonds, aes_string(x = input$x, y = input$y, color = input$color)) +
            geom_point()
    })
    
    
    #cuts plot
    output$cutanalytics <- renderPlot({
        ggplot(data = diamonds) + 
            geom_bar(mapping = aes(x = cut, fill = clarity))
    })
    
    #cuts interactive plot with plotly
    output$cutinteractive <- renderPlotly({
        ggplotly(
            ggplot(data = diamonds, aes(factor(cut), price, fill=cut)) + 
                geom_boxplot() + 
                xlab("Type of Cut") + 
                ylab("Diamond Price US$") + 
                coord_cartesian(ylim=c(0,7500))
        )
    })
    
    #carat frequency
    output$caratfreq <- renderPlot({
        ggplot(data=diamonds, aes(x=carat)) + 
            geom_freqpoly(binwidth = 0.025) + 
            ggtitle("Diamond Frequency by Carat") + 
            xlab("Carat Size") + 
            ylab("Count") + 
            scale_x_continuous(minor_breaks = seq(0, 5.5, 0.1))
    })
    
    #Diamond Price per Carat U$
    output$caratPlot2 <- renderPlot({
        ggplot(diamonds, aes(factor(color), (price/carat), fill=color)) + 
            geom_boxplot() + 
            ggtitle("Diamond Price per Carat according Color") + 
            xlab("Color") + 
            ylab("Diamond Price per Carat U$") + 
            coord_cartesian(ylim=c(0,7500))
    })
}


# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
