# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

home_tab <- tabPanel("Overview", fluid = TRUE,
                     
                     mainPanel(
                       
                       h3("Data Documentation"),
                       
                       p("We obtain the flight price data from Kaggle, and analyze the subset of flight price data for flights departing
                         from MIA. This data is collected by a web crawler on Expedia, where each observation is a ticket for sale on 
                         Expedia between April 16, 2022 and October 5, 2022 to/from the following airports: ATL, DFW, DEN, ORD, LAX, 
                         CLT, MIA, JFK, EWR, SFO, DTW, BOS, PHL, LGA, IAD, OAK."),
                       
                       br(),
                       
                       h4("Data Dimensions"),
                       
                       p("The original dataset is 31.09 GB in size, containing over 70 million rows and 27 columns. After our data wrangling,
                         the data containing only flights departing from MIA is 607.9 MB in size, with 4.2 million rows and 12 columns."),
                       
                       br(),
                       
                       h4("Data Wrangling Process"),
                       
                       p("The original dataset is 31.09 GB in size, containing over 70 million rows and 27 columns. After our data wrangling,
                         the data containing only flights departing from MIA is 607.9 MB in size, with 4.2 million rows and 12 columns."),
                       
                       h4("Variable Definitions and Units"),
                       
                       p("The original dataset is 31.09 GB in size, containing over 70 million rows and 27 columns. After our data wrangling,
                         the data containing only flights departing from MIA is 607.9 MB in size, with 4.2 million rows and 12 columns."),
                       
                       br()
                    
                       
                     ), 
                     
                     sidebarPanel(
                       
                       h4("Data Source"),
                       
                       br(),
                       
                       h4("Variables of Interest"),
                       
                       h5("Joshua Ingram"),
                       
                       h5("David Nezelek"),
                       
                       h5("Fehmi Neffati"),
                       
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