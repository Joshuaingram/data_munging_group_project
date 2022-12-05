# User Interface File for Flare Detection App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)
source(file = "user_interface/overview_tab.R")
source(file = "user_interface/data_tab.R")
source(file = "user_interface/quality_tab.R")
source(file = "user_interface/analysis_tab.R")


ui <- fluidPage(
  
  withMathJax(),
  
  # title
  titlePanel("Analysis of Miami Flight Price Data", windowTitle = "Miami Flight Data"),
  
  # tabsetPanel allows for multiple tabPanels that contain their own sidebarLayouts and mainPanels
  tabsetPanel(
    
    # Tab for Overview of Project page
    overview_tab,
    
    # Tab for Data Documentation page
    data_tab,
    
    # Tab for Data Quality page
    quality_tab,
    
    # Tab for Data Analysis page
    analysis_tab
    
  )
  
)