# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

exploration_tab <- tabPanel("Data Exploration", fluid = TRUE,
                     
                     sidebarLayout(
                       
                       sidebarPanel(
                         h4("Data Selection"),
                         
                         varSelectInput(inputId = "variable_metric", 
                                        label = "Variable:", 
                                        data = flights, 
                                        multiple = TRUE,
                                        selected = c("legId", "firstAirline", "departureHour", "arrivalHour",
                                                     "layoverDurationInHours", "seatsRemaining", "totalFare",
                                                     "destinationAirport")
                         ),
                         
                         selectInput(inputId = "airport_metric", 
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
                         selectInput(inputId = "airline_metric", 
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
                         h4("Metric Parameters"),
                         numericInput(inputId = "needed_metric", value = 10000, step = 1, label = "$$N_{\\text{needed}}:$$"),
                         #### FIX THIS TO TAKE IN A OBJECT CLASS AND THEN COMPARE POSSIBLE TYPES TO SELECTED VARIABLE ####
                         selectInput(inputId = "format_metric", 
                                     label = "Standarized Format:",
                                     multiple = TRUE,
                                     choices = c("Numeric" = "numeric",
                                                 "Integer" = "integer",
                                                 "Factor" = "factor",
                                                 "Character" = "character"),
                                     selected = c("numeric", "integer", "factor", "character")
                         ),
                         
                       ),
                       
                       mainPanel(
                         
                         dataTableOutput("metric_table1")
                         
                       )
                       
                     )
                     
)