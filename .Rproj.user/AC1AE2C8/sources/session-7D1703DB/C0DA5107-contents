# User Interface - Home tab for Flare Detection Model App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

data_tab <- tabPanel("Data Documentation", fluid = TRUE,
                     
                     mainPanel(
                       
                       h3("Data Documentation"),
                       
                       p("We obtain the flight price data from Kaggle and analyze the subset of flight price data listed one day before 
                         departure for flights departing
                         from MIA. This data is collected from Expedia by a web crawler, where each observation is a ticket for sale on 
                         Expedia between April 16, 2022 and October 5, 2022 to/from the following airports: ATL, DFW, DEN, ORD, LAX, 
                         CLT, MIA, JFK, EWR, SFO, DTW, BOS, PHL, LGA, IAD, OAK."),
                       
                       br(),
                       
                       h4("Data Dimensions"),
                       
                       p("The original dataset is 31.09 GB in size, containing over 70 million rows and 27 columns. After our data wrangling,
                         the data containing only flights prices one day before departing from MIA is 6.235 MB in size, with 82,550 million rows and 9 columns."),
                       
                       br(),
                       
                       h4("Data Wrangling Process"),
                       
                       p("We began by subsetting the original dataset of ~6,000,000 flights to/from the 15 busiest US airports. 
                         We decided to consider only the ~300,000 flights which departed from Miami International Airport. 
                         We wrote code to recursively read in chunks of rows with (startingAirport == ‘MIA’) until all of the desired flights were loaded. 
                         We then saved these observations as a CSV file. This process yielded a file 1.6GB in size, greatly reduced from the original 31GB file on Kaggle. 
                         Prior to examining the data, we identified several variables of interest in the original dataset, and several new variables which we needed to encode."),
                       
                       h5("Variables we created:"),
                       
                       tags$ul(
                         tags$li(strong("daysInAdvance:"), "difference between the dataset variables flightDate and search Date."),
                         tags$li(strong("departureHour:"), "extracted from dataset variable segmentsDepartureTimeEpochSeconds."),
                         tags$li(strong("ArrivalHour:"), "extracted from dataset variable segmentsArrivalTimeEpochSeconds."),
                         tags$li(strong("layoverDurationInHours:"), "calculated from dataset variables travelDuration and segmentDurationInSeconds."),
                         tags$li(strong("firstAirline:"), "extracted from dataset variable airlineName.")
                         ),
                       
                       p("We used the first variable we coded, daysInAdvance, to further subset our observations. 
                         Of the ~4,000,000 searches of flights from MIA, we kept only the ~80,000 searches performed one day in advance of the flight. 
                         We then calculated the four remaining new variables. We saved to CSV these ~80,000 rows and the nine variables listed above, yielding a 6 MB file."),
                       
                       br(),
                       
                       h4("Variable Definitions and Units"),
                       
                       tags$ul(
                         tags$li(strong("legId:"), "identifier for each listed flight ticket."),
                         tags$li(strong("searchDate:"), "The date (YYYY-MM-DD) on which this entry was taken from Expedia."), 
                         tags$li(strong("flightDate:"), "The date (YYYY-MM-DD) of the flight."), 
                         tags$li(strong("startingAirport:"), "Three-character IATA airport code for the initial location."),
                         tags$li(strong("destinationAirport:"), "Three-character IATA airport code for the arrival location."),
                         tags$li(strong("fareBasisCode:"), "The fare basis code."), 
                         tags$li(strong("travelDuration:"), "The travel duration in hours and minutes."), 
                         tags$li(strong("elapsedDays:"), "The number of elapsed days (usually 0)."),
                         tags$li(strong("isBasicEconomy:"), "Boolean for whether the ticket is for basic economy."), 
                         tags$li(strong("isRefundable:"), "Boolean for whether the ticket is refundable."),
                         tags$li(strong("isNonStop:"), "Boolean for whether the flight is non-stop."), 
                         tags$li(strong("baseFare:"), "The price of the ticket (in USD)."), 
                         tags$li(strong("totalFare:"), "The price of the ticket (in USD) including taxes and other fees."),
                         tags$li(strong("seatsRemaining:"), "Integer for the number of seats remaining."),
                         tags$li(strong("totalTravelDistance:"), "The total travel distance in miles. This data is sometimes missing."), 
                         tags$li(strong("segmentsDepartureTimeEpochSeconds:"), "String containing the departure time (Unix time) for each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."), 
                         tags$li(strong("segmentsDepartureTimeRaw:"), "String containing the departure time (ISO 8601 format: YYYY-MM-DDThh:mm:ss.000±[hh]:00) 
                                 for each leg of the trip. The entries for each of the legs are separated by '||'."),
                         tags$li(strong("segmentsArrivalTimeEpochSeconds:"), "String containing the arrival time (Unix time) for each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."), 
                         tags$li(strong("segmentsArrivalTimeRaw:"), "String containing the arrival time (ISO 8601 format: YYYY-MM-DDThh:mm:ss.000±[hh]:00) for each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."),
                         tags$li(strong("segmentsArrivalAirportCode:"), "String containing the IATA airport code for the arrival location for each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."), 
                         tags$li(strong("segmentsDepartureAirportCode:"), "String containing the IATA airport code for the departure location for each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."), 
                         tags$li(strong("segmentsAirlineName:"), "String containing the name of the airline that services each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."),
                         tags$li(strong("segmentsAirlineCode:"), "String containing the two-letter airline code that services each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."),
                         tags$li(strong("segmentsEquipmentDescription:"), "String containing the type of airplane used for each leg of the trip (e.g. 'Airbus A321' or 'Boeing 737-800'). 
                                 The entries for each of the legs are separated by '||'."), 
                         tags$li(strong("segmentsDurationInSeconds:"), "String containing the duration of the flight (in seconds) for each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."), 
                         tags$li(strong("segmentsDistance:"), "String containing the distance traveled (in miles) for each leg of the trip. 
                                 The entries for each of the legs are separated by '||'."),
                         tags$li(strong("segmentsCabinCode:"), "String containing the cabin for each leg of the trip (e.g. 'coach'). 
                                 The entries for each of the legs are separated by '||'."), 
                         tags$li(strong("firstAirline:"), "Airline offering the flight ticket. The first airline is given 
                                 if the flight ticket is made up of multiple segments from multiple airlines."), 
                         tags$li(strong("departureHour:"), "Hour of the day at which flight is scheduled to depart."),
                         tags$li(strong("arrivalHour:"), "Hour of the day at which flight is scheduled to arrive at final airport."),
                         tags$li(strong("layoverDurationInHours:"), "Total number of hours between segments for connecting flights."), 
                         tags$li(strong("daysInAdvance:"), "Number of days before departure that the ticket price was observed.")
                         
                       ),
                       
                       br()
                       
                     ),
                    
                     
                     sidebarPanel(
                       
                       h4("Data Source"),
                       
                       a(
                         img(src = "kaggle_logo.png", 
                             style="display: block; margin-left: auto; margin-right: auto;", 
                             height = "35%", width = "35%"
                         ), 
                         href="https://www.kaggle.com/datasets/dilwong/flightprices"
                       ),
                       
                       br(),
                       
                       h4("Variables of Interest"),
                       
                       tags$ul(
                         tags$li(strong("legId:"), "Unique identifier for each listed flight ticket."), 
                         tags$li(strong("firstAirline:"), "Airline offering the flight ticket. The first airline is given 
                                 if the flight ticket is made up of multiple segments from multiple airlines."), 
                         tags$li(strong("departureHour:"), "Hour of the day at which flight is scheduled to depart."),
                         tags$li(strong("arrivalHour:"), "Hour of the day at which flight is scheduled to arrive at final airport."),
                         tags$li(strong("layoverDurationInHours:"), "Total number of hours between segments for connecting flights."), 
                         tags$li(strong("seatsRemaining:"), "Integer for the number of seats remaining."),
                         tags$li(strong("totalFare:"), "The price of the ticket (in USD) including taxes and other fees."),
                         tags$li(strong("destinationAirport:"), "Three-character IATA airport code for the arrival location.")
                         
                       )
                       
                       
                     )
                     
                     
)