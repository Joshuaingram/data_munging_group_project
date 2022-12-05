library(data.table)
library(anytime)
library(stringi)
library(stringr)
library(tidyverse)
setwd("C:/Users/nezel/Datamunging/group_project")
data <- fread("flights_miami_large.csv")
attach(data)
head(data)
data$daysInAdvance <- flightDate - searchDate
data$departureHour <- as.integer(substr(anytime(as.numeric(substr(segmentsDepartureTimeEpochSeconds,1,10))),12,13))
data$arrivalHour <- as.integer(substr(anytime(as.numeric(stri_extract(segmentsArrivalTimeEpochSeconds,regex="[0-9]{10}(?!\\|\\|)"))),12,13))
data$layoverDurationInMinutes <- (1/60)*(as.integer(3600*as.numeric(stri_extract(travelDuration,regex="(?<=PT)[0-9]{1,2}(?=H)")) + 60*as.numeric(stri_extract(travelDuration,regex="(?<=H)[0-9]{1,2}(?=M)")) - sapply(lapply(str_split(segmentsDurationInSeconds,"\\|\\|"),as.numeric),sum)))
data$firstAirline <- stri_extract(segmentsAirlineName, regex="[:alpha:]+(?!\\|\\|)")

latestFlights <- data %>%
  group_by(legId) %>%
  filter(daysInAdvance == 1)

ggplot(data = latestFlights, aes(x = seatsRemaining, y = totalFare)) +
  geom_point()

ggplot(data = latestFlights, aes(x = totalFare)) +
  geom_histogram()

ggplot(data = latestFlights, aes(x = seatsRemaining)) +
  geom_histogram()

ggplot(data = latestFlights, aes(x = seatsRemaining, fill = firstAirline)) + geom_histogram()

# Scatter plot
# plot(daysInAdvance, totalFare, pch = 19, col = factor(seatsRemaining))
