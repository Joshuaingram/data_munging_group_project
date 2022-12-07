# Miami Flight Prices - Data Munging Group Project

This is the Fall 2022 Data Munging and Exploratory Data Analysis group project repository.

**Group Members:**

Joshua D. Ingram (joshuaingram) - Project management, data downloading, app development, data visualization

Fehmi Neffati (fneffati) - Quality metrics, coding style, file management, data visualization

David Nezelek (dnezelek) - Data discovery, data structuring, data visualization

## Project Overview
Flight prices are notoriously volatile. Two passengers flying between the same two airports – perhaps on the same airline, on the same date, even seated next to each other on the same flight – may have paid quite different prices for their seats. In this project, we use a publicly available set of automated Expedia flight searches to explore how flight prices vary by a collection of factors.

## Data
We obtain the flight price data from Kaggle and analyze the subset of flight price data listed one day before departure for flights departing from MIA. This data is collected from Expedia by a web crawler, where each observation is a ticket for sale on Expedia between April 16, 2022 and October 5, 2022 to/from the following airports: ATL, DFW, DEN, ORD, LAX, CLT, MIA, JFK, EWR, SFO, DTW, BOS, PHL, LGA, IAD, OAK.

The original dataset is 31.09 GB in size, containing over 70 million rows and 27 columns. After our data wrangling, the data containing only flights prices one day before departing from MIA is 6.235 MB in size, with 82,550 million rows and 9 columns.

