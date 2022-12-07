# Server File for Flare Detection App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)
library(readr)
source("source_scripts/quality_metrics.R")

# load in airline data
flights <- read_csv("data/miami_flights_final.csv")
flights$seatsRemaining <- as.integer(flights$seatsRemaining)
flights$totalFare <- as.numeric(flights$totalFare)
flights$firstAirline <- as.factor(flights$firstAirline)
flights$layoverDurationInHours <- as.numeric(flights$layoverDurationInHours)
flights$arrivalHour <- as.integer(flights$arrivalHour)
flights$departureHour <- as.integer(flights$departureHour)
flights$destinationAirport <- as.factor(flights$destinationAirport)

server <- function(input, output, session){
  
  # filtering for metric page
  flights_metric <- reactive({
    
    data <- flights %>% 
      filter(firstAirline %in% input$airline_metric &
             destinationAirport %in% input$airport_metric) %>%
      select(!!!input$variable_metric)
    data
    
  })
  
  output$metric_table1 <- renderDataTable({
    data <- flights_metric()
    data
  })
  
  # filtering for group exploration subpage
  flights_group <- reactive({
    
    data <- flights %>% 
      filter(firstAirline %in% input$airline_group &
               destinationAirport %in% input$airport_group)
    data
    
  })
  
  output$group_graphs1 <- renderPlot({
    
    data <- flights_group()
    
    if (input$vis_group == "box"){
      
      # boxplot by categories
      p1 <- ggplot(data = data, aes(x = !!input$variable_group, fill = as.factor(!!input$groupby_group))) +
        geom_boxplot() +
        theme_bw(base_size = 20)
      
    }
    if (input$vis_group == "hist"){
      
      # boxplot by categories
      p1 <- ggplot(data = data, aes(x = !!input$variable_group, fill = as.factor(!!input$groupby_group))) +
        geom_histogram() +
        theme_bw(base_size = 20)
      
    }
    if (input$vis_group == "dot"){
      
      # boxplot by categories
      p1 <- ggplot(data = data, aes(x = !!input$variable_group, fill = as.factor(!!input$groupby_group))) +
        geom_dotplot(binwidth = 10) +
        theme_bw(base_size = 20)
      
    }
    
      
      
      p1
    
  })
  
  # filtering for association exploration
  flights_assoc <- reactive({
    
    data <- flights %>% 
      filter(firstAirline %in% input$airline_group &
               destinationAirport %in% input$airport_group)
    data
    
  })
  
  output$assoc_graphs1 <- renderPlot({
    
    data <- flights_assoc()
    
    if (input$curve_assoc == "none"){
      
      # scatterplot by categories
      p1 <- ggplot(data = data, aes(x = !!input$variable1_assoc, 
                                    y = !!input$variable2_assoc,  
                                    color = as.factor(!!input$groupby_assoc))) +
        geom_point() +
        theme_bw(base_size = 20)
      
    }
    
    if (input$curve_assoc == "linear"){
      
      # scatterplot by categories
      p1 <- ggplot(data = data, aes(x = !!input$variable1_assoc, 
                                    y = !!input$variable2_assoc,  
                                    color = as.factor(!!input$groupby_assoc))) +
        geom_point() +
        geom_smooth(method = "lm") +
        theme_bw(base_size = 20)
      
    }
    
    if (input$curve_assoc == "smooth"){
      
      # scatterplot by categories
      p1 <- ggplot(data = data, aes(x = !!input$variable1_assoc, 
                                    y = !!input$variable2_assoc,  
                                    color = as.factor(!!input$groupby_assoc))) +
        geom_point() +
        geom_smooth(method = "loess") +
        theme_bw(base_size = 20)
      
    }
    
    
    
    p1
    
  })
  
}