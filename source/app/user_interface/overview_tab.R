# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

home_tab <- tabPanel("Overview", fluid = TRUE,
                     
                     mainPanel(
                       
                       h3("Overview - Miami Flight Prices"),
                       
                       p(""),
                       
                       br(),
                       
                       img(src = "www/flare_and_ar.png", style="display: block; margin-left: auto; margin-right: auto;", height = "60%", width = "60%"),
                       
                       br(),
                       
                       p("This web app outlines and visualizes the probability-discounted power-law model, as well as allows
                         for the user to fit the model to subsets of real and simulated satellite datasets."),
                       
                       br(),
                       
                       br()
                       
                     ), 
                     
                     sidebarPanel(
                       
                       h4("Github Repository"),
                       
                       br(),
                       
                       h4("Group Members"),
                       
                       h5("Joshua Ingram"),
                       
                       h5("David Nezelek"),
                       
                       h5("Fehmi Nefatti"),
                       
                       a(img(src = "www/b_class_video.png", 
                             style="display: block; margin-left: auto; margin-right: auto;", 
                             height = "50%", width = "50%"
                       ), 
                       href="https://youtu.be/k7XUanUlcN4"),
                       
                       br(),
                       
                       h5("M-Class Flare:"),
                       
                       a(img(src = "www/m_class_video.png", 
                             style="display: block; margin-left: auto; margin-right: auto;", 
                             height = "50%", width = "50%"
                       ), 
                       href="https://youtu.be/JTDZrQt17QI"),
                       
                       br(),
                       
                       h5("X-Class Flare:"),
                       
                       a(img(src = "www/x_class_video.png", 
                             style="display: block; margin-left: auto; margin-right: auto;", 
                             height = "50%", width = "50%"
                       ), 
                       href="https://youtu.be/W3NTxPCJjFU"),
                       
                       br()
                       
                       
                     )
                     
                     
)