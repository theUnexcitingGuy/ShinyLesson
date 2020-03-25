
# libraries ---------------------------------------------------------------
library(shiny)
library(shinydashboard) #never forget to import this library otherwise the dashboard does not have the layout

# UI side -----------------------------------------------------------------
ui <- shinyUI(
    dashboardPage(skin = 'yellow',
                  dashboardHeader(title = "Title goes here"),
                  #sidebar on the left with sections
                  dashboardSidebar(
                    #lets add sections
                    sidebarMenu(
                      #syntax: menuItem(id, title, icon), the icons are taken from fontAwsome: https://fontawesome.com/icons?d=gallery&q=profile
                      menuItem(" Section 1",tabName = "id1", icon = icon("amazon-pay")),
                      menuItem(" Section 2", tabName = "id2", icon = icon("aws")) 
                    )
                  ),
                  
                  #lets add tabs in the body of the dashboard
                  dashboardBody(
                    #lets activate the sections, syntax: tabItems(tabItem(tabName = 'id of the section'))
                    tabItems(
                      #Section 1
                      tabItem(
                        tabName = 'id1', 
                        h2('Ciao ci siamo'), 
                        actionButton('id3', 'Ciao'), 
                        p('ciao siamo nella sezione 1')
                      ), 
                      #Section 2
                      tabItem(
                        tabName = 'id2', 
                        h2('Welcome to section 2'), 
                        selectInput('d4', 'Label', c('Yes'))
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
