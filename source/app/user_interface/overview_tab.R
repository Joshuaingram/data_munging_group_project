# User Interface - Miami Flight Price Data App (Data Munging Group Project)
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

overview_tab <- tabPanel("Overview", fluid = TRUE,
                     
                     mainPanel(
                       
                       h3("Overview"),
                       
                       img(src = "MIA_photo2.jpeg", style="display: block; margin-left: auto; margin-right: auto;", 
                           height = "60%", width = "60%"),
                       
                       br(),
                       
                       p("DO THIS"),
                       
                       br(),
                       
                       h4("Summary of Results"),
                       
                       p("DO THIS"),
                       
                       br(),
                       
                       h4("Group Contributions"),
                       
                       p("With help from David and Fehmi, Joshua wrote the code to download the MIA-departing flights from the original Kaggle dataset. 
                         David examined the dataset variables, selected the existing variables of interest, and determined the new variables to be coded and wrote the necessary code. 
                         Fehmi assisted David with rewriting his code to be human-legible, in a consistent style and with appropriate comments, and with properly utilizing GitHub to keep files consistent among the team. 
                         With help from Joshua and Fehmi, David determined appropriate plots and wrote the necessary code. 
                         Fehmi determined appropriate data quality metrics and wrote the necessary code. 
                         Joshua organized the project from start to finish: outlining the process, setting goals and deadlines, and assigning tasks equitably and according to team member strengths. 
                         Joshua also wrote all of the code for the web app and organized the presentation."),
                       
                       br(),
                       
                     ), 
                     
                     sidebarPanel(
                       
                       h4("Github Repository"),
                       
                       a(
                         img(src = "github_logo2.png", 
                             style="display: block; margin-left: auto; margin-right: auto;", 
                             height = "25%", width = "25%"
                       ), 
                       href="https://github.com/Joshuaingram/data_munging_group_project"
                       ),
                       
                       br(),
                       
                       h4("Group Members"),
                       
                       h5("Joshua Ingram", style = "text-align: center"),
                       
                       img(src = "josh.jpeg",
                             style="display: block; margin-left: auto; margin-right: auto;", 
                             height = "30%", width = "30%"
                             ),
                       
                       tags$a(href="mailto:joshua.ingram18@ncf.edu", 
                              tags$p("joshua.ingram18@ncf.edu", 
                                     style = "text-align: center")),
                       
                       tags$a(href="https://github.com/Joshuaingram", 
                              tags$p("joshuaingram", 
                                     style = "text-align: center")),
                       
                       tags$ul(
                         tags$li("Project management, data downloading, app development, data visualization")
                       ),
                       
                       h5("Fehmi Neffati", style = "text-align: center"),
                       
                       img(src = "fehmi.png",
                           style="display: block; margin-left: auto; margin-right: auto;", 
                           height = "30%", width = "30%"
                       ),
                       
                       tags$a(href="mailto:fehmi.neffati24@ncf.edu", 
                              tags$p("fehmi.neffati24@ncf.edu",
                                     style = "text-align: center")),
                       
                       tags$a(href="https://github.com/FNeffati", 
                              tags$p("fneffati", 
                                     style = "text-align: center")),
                       
                       tags$ul(
                         tags$li("Quality metrics, coding style, file management, data visualization")
                       ),
                       
                       h5("David Nezelek", style = "text-align: center"),
                       
                       img(src = "david.jpg",
                             style="display: block; margin-left: auto; margin-right: auto;", 
                             height = "30%", width = "30%"
                       ),
                       
                       tags$a(href="mailto:david-paul.nezelek97@ncf.edu", 
                              tags$p("david-paul.nezelek97@ncf.edu", 
                                     style = "text-align: center")),
                       
                       tags$a(href="https://github.com/dnezelek", 
                              tags$p("dnezelek", 
                                     style = "text-align: center")),
                       
                       tags$ul(
                         tags$li("Data discovery, data structuring, data visualization")
                         
                         )
                       
                       
                       
                     )
                     
                     
)