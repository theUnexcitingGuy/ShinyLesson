
# libraries ---------------------------------------------------------------
library(shiny)
library(shinydashboard) #never forget to import this library otherwise the dashboard does not have the layout

# UI side -----------------------------------------------------------------
ui <- shinyUI(
    dashboardPage(skin = 'yellow',
                  dashboardHeader(title = "Title goes here"),
                  dashboardSidebar(), #sidebar on the left
                  
                  #lets add tabs in the body of the dashboard
                  dashboardBody(
                      #to add panels you need to write tabsetPanel(type = 'tab, (tabPanel('name of the tab')))
                      tabsetPanel(
                          type = 'tab', #what happens when you put typoe = 'pills'
                          tabPanel('Sezione 1', 
                                   selectInput('id', 'ciao', c('yes'))
                                   ), 
                          tabPanel('Second tab', 
                                   actionButton('id-2', 'Ciaocc')
                                   )
                      )
                  ) 
    )
)


# server side -------------------------------------------------------------
server <- function(input, output) {
}

# run the app -------------------------------------------------------------
shinyApp(ui = ui, server = server)
