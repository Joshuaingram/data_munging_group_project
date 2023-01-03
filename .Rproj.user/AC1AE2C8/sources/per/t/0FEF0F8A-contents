# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

group_tab <- tabPanel("Group", fluid = TRUE,
                            
                      sidebarLayout(
                        
                        sidebarPanel(
                          h4("Data Selection"),
                          
                          varSelectInput(inputId = "variable_group", 
                                         label = "Variable:", 
                                         data = flights,
                                         selected = c("totalFare")
                          ),
                          
                          selectInput(inputId = "airport_group", 
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
                          selectInput(inputId = "airline_group", 
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
                          
                          h4("Grouping"),
                          
                          varSelectInput(inputId = "groupby_group", 
                                         label = "Group By:", 
                                         data = flights,
                                         selected = c("firstAirline")
                          ),
                          
                          h4("Visualization"),
                          
                          selectInput(inputId = "vis_group", 
                                         label = "Plot Type:", 
                                         choices = c("Boxplot" = "box",
                                                    "Histogram" = "hist",
                                                    "Dotplot" = "dot",
                                                    "Barplot" = "bar"),
                                         selected = c("box")
                                         
                                         
                          ),

                        ),
                        
                        mainPanel(
                          
                          plotOutput("group_graphs1")
                          
                        )
                        
                      )
                            
)