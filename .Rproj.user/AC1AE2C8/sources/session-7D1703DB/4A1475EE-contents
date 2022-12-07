# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)


associations_tab <- tabPanel("Associations", fluid = TRUE,
                            
                             sidebarLayout(
                               
                               sidebarPanel(
                                 h4("Data Selection"),
                                 
                                 varSelectInput(inputId = "variable1_assoc", 
                                                label = "Variable 1:", 
                                                data = flights,
                                                selected = c("totalFare")
                                 ),
                                 
                                 varSelectInput(inputId = "variable2_assoc", 
                                                label = "Variable 2:", 
                                                data = flights,
                                                selected = c("seatsRemaining")
                                 ),
                                 
                                 selectInput(inputId = "airport_assoc", 
                                             label = "Destination Airport:",
                                             multiple = TRUE,
                                             choices = c("Hartsfield-Jackson Atlanta International" = "ATL",
                                                         "Boston Logan International" = "BOS",
                                                         "Charlotte Douglas International" = "CLT",
                                                         "Denver International" = "DEN",
                                                         "Dallas/Fort Worth International" = "DFW",
                                                         "Detroit Metropolitan" = "DTW",
                                                         "Newark Liberty International" = "EWR",
                                                         "Dulles International" = "IAD",
                                                         "John F. Kennedy International" = "JFK",
                                                         "Chicago O'Hare International" = "ORD",
                                                         "Los Angeles International" = "LAX",
                                                         "LaGuardia" = "LGA",
                                                         "Oakland International" = "OAK",
                                                         "O'Hare International" = "ORD",
                                                         "Philadelphia International" = "PHL",
                                                         "San Francisco International" = "SFO"),
                                             selected = c("ATL", "BOS", "CLT", "DEN", "DFW", "DTW", "EWR",
                                                          "IAD", "JFK", "ORD", "LAX", "LGA", "OAK", "ORD",
                                                          "PHL", "SFO")
                                 ),
                                 selectInput(inputId = "airline_assoc", 
                                             label = "Airline:",
                                             multiple = TRUE,
                                             choices = c("Alaska" = "Alaska",
                                                         "American" = "American",
                                                         "Delta" = "Delta",
                                                         "Frontier" = "Frontier",
                                                         "JetBlue" = "JetBlue",
                                                         "Spirit" = "Spirit",
                                                         "Sun" = "Sun",
                                                         "United" = "United"),
                                             selected = c("Alaska", "American", "Delta", "Frontier", "JetBlue",
                                                          "Spirit", "Sun", "United")
                                 ),
                                 
                                 h4("Coloring"),
                                 
                                 varSelectInput(inputId = "groupby_assoc", 
                                                label = "Group By:", 
                                                data = flights,
                                                selected = c("firstAirline")
                                 ),
                                 
                                 h4("Curve"),
                                 
                                 selectInput(inputId = "curve_assoc", 
                                             label = "Add Curve:", 
                                             choices = c("None" = "none",
                                                         "Linear Regression" = "linear",
                                                         "LOESS" = "smooth"),
                                             selected = c("none"))
                                 
                               ),
                               
                               mainPanel(
                                 
                                 plotOutput("assoc_graphs1")
                                 
                               )
                               
                             )
                            
                            )