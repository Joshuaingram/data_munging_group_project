# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

quality_tab <- tabPanel("Quality Metrics", fluid = TRUE,
                        
                        h3("Data Quality Metrics"),
                        
                        p("To assess the data quality, we identify and calculate data quality metrics with the reduced Miami
                          flights dataset. This app allows the user to subset the dataset and choose parameter values for the metrics."),
                        
                        br(),
                        
                        h4("Appropriate Amount of Data"),
                        
                        p("This metric will reflect whether the quantity of data in a column is too little or too much.
                          To calculate the appropriate amount of data we need to calculate two ratios:",
                          tags$ul(
                            tags$li("the ratio of the number of data units provided to the number of data units needed"),
                            tags$li("the ratio of the number of data units needed to the number of data units provided")
                          ),
                           "The metric is given by the minimum of the two ratios.
                          
                          $$\\text{Appropriate Amount of Data} = \\min ( \\frac{N_{\\text{provided}}}{N_{\\text{needed}}}, 
                          \\frac{N_{\\text{needed}}}{N_{\\text{provided}}}  )$$"
                          ),
                        
                        br(),
                        
                        h4("Completeness"),
                        
                        p("This metric measures the ratio of desired outcomes to total outcomes. In context, this is the proportion of
                          non-missing data in each column.
                          
                          $$\\text{Completeness} = 1 - \\frac{N_{\\text{NA}}}{N_{\\text{total}}}.$$"),
                        
                        br(),
                        
                        h4("Consistent Representation"),
                        
                        p("This metric reflects consistency of data stored in a standardized format. It is the proportion
                          of data stored in the desired standardized format.
                          
                          $$\\text{Completeness} = 1 - \\frac{N_{\\text{inconsistent}}}{N_{\\text{total}}}.$$"),
                        
                        br(),
                        
                        sidebarLayout(
                          
                          sidebarPanel(
                            h4("Data Selection"),
                            selectInput(inputId = "variable_metric", 
                                        label = "Variable:",
                                        multiple = TRUE,
                                        choices = c("Variable Name 1" = "Variable Code 1",
                                                    "Variable Name 2" = "Variable Code 2"
                                        )),
                            selectInput(inputId = "airport_metric", 
                                        label = "Destination Airport:",
                                        multiple = TRUE,
                                        choices = c("Airport Name 1" = "Airport Code 1",
                                                    "Airport Name 2" = "Airport Code 2"
                                                    )),
                            selectInput(inputId = "airline_metric", 
                                        label = "Airline:",
                                        multiple = TRUE,
                                        choices = c("Airline Name 1" = "Airline Code 1",
                                                    "Airline Name 2" = "Airline Code 2"
                                        )),
                            h4("Metric Parameters:"),
                            numericInput(inputId = "needed_metric", value = 10000, step = 1, label = "$$N_{\\text{needed}}:$$"),
                            #### FIX THIS TO TAKE IN A OBJECT CLASS AND THEN COMPARE POSSIBLE TYPES TO SELECTED VARIABLE ####
                            selectInput(inputId = "format_metric", 
                                        label = "Standarized Format:",
                                        multiple = TRUE,
                                        choices = c("Class 1" = "Class 1",
                                                    "Class 2" = "Class 2"
                                        )),
                            
                          ),
                          
                          mainPanel(
                            
                            #tableOutput("metric_table1",)
                            
                          )
                          
                        )
                     
                     
)