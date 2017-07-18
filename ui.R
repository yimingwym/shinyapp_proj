library(shiny)
library(shinydashboard)

shinyUI(dashboardPage( skin = 'black',
    dashboardHeader(title = "Chicago taxi 2016"),
    dashboardSidebar(
        
        sidebarUserPanel("Chicago Cabs",
                         image = "http://www.chicagocabservice.com/images/logo.png"),
        sidebarMenu(
            menuItem("Taxi ride activity", tabName = "taxi1", icon = icon("map")),
            menuItem("Between pickups and dropoffs", tabName = "taxi2", icon = icon("map")),
            menuItem("Centre and the airports", tabName = "taxi3", icon = icon("map")),
            menuItem("Cost distribution", tabName = "taxi4", icon = icon("map")),
            menuItem("Passenger habits", tabName = "taxi5", icon = icon("map")),
            menuItem("Rides per second", tabName = "taxi6", icon = icon("line-chart"))
        )
    ),
    dashboardBody(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
        ),
        tabItems(
            tabItem(tabName = "taxi1",
                    fluidRow(
                     splitLayout(
                       cellWidths =  c("25%", "75%"),
                       box(selectizeInput("pk_dp",
                                       "Pickup or Dropoff",
                                       c('pickup', 'dropoff')),
                       selectizeInput("day_type1",
                                       "Weekdays",
                                      c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Festival')),
                       selectizeInput("d_n1",
                                       "Daytime or Night",
                                      c('daytime','night')), width = 12, height = 400),
                       box(imageOutput("taxiplot1"), width = 12, height = 620)
                       )
                    )),
            tabItem(tabName = "taxi2",
                    fluidRow(
                      splitLayout(
                        cellWidths =  c("25%", "75%"),
                        box(selectizeInput("day_type2",
                                           "Weekdays",
                                           c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Festival')),
                            selectizeInput("d_n2",
                                           "Daytime or Night",
                                           c('daytime','night')), width = 12, height = 400),
                        box(imageOutput("taxiplot2"), width = 12, height = 620)
                      )
                    )),
            
            tabItem(tabName = "taxi3",
                    fluidRow(
                      splitLayout(
                        cellWidths =  c("25%", "75%"),
                        box(
                            selectizeInput("from",
                                           "From:",
                                           c('Centre','Airports')), width = 12, height = 400),
                        box(imageOutput("taxiplot3"), width = 12, height = 620)
                      )
                    )),
             
            tabItem(tabName = "taxi4",
                    fluidRow(
                      splitLayout(
                        cellWidths =  c("30%", "70%"),
                        box(
                          selectizeInput("cost_per_minute",
                                         "Show distribution (price per min.)",
                                         c('of cost from each community','of cost to each community')), width = 12, height = 400),
                        box(imageOutput("taxiplot4"), width = 12, height = 620)
                      )
                    )),
                   
            tabItem(tabName = "taxi5",
                    fluidRow(
                      splitLayout(
                        cellWidths =  c("30%", "70%"),
                        box(
                          selectizeInput("miles_per_trip",
                                         "Show distribution (per trip)",
                                         c('of miles from each community','of miles to each community')), width = 12, height = 400),
                        box(imageOutput("taxiplot5"), width = 12, height = 620)
                      )
                    )),
            
            tabItem(tabName = "taxi6",
                    fluidRow(

                        box(imageOutput("taxiplot6"), width = 12, height = 620
                            ),
                        style="display: block; margin-left: auto; margin-right: auto;"
                      
                    ))
            
        )
    )
))