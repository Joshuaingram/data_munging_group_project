# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)
source(file = "user_interface/group_tab.R")
source(file = "user_interface/associations_tab.R")

exploration_tab <- tabPanel("Data Exploration", fluid = TRUE,
                            tabsetPanel(
                              
                              group_tab,
                              
                              associations_tab
                              
                            ))