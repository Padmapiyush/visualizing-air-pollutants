# Load required libraries
library(ggplot2)
library(dplyr)

# Load data
air_pollution <- read.csv("air_pollution.csv")

# Inspect data
head(air_pollution)

# Plot distribution of PM2.5
ggplot(data = air_pollution, aes(x = PM2.5)) +
  geom_density(fill = "#FF6666", alpha = 0.7) +
  scale_x_continuous(name = "PM2.5 concentration (µg/m³)") +
  scale_y_continuous(name = "Density") +
  ggtitle("Distribution of PM2.5 in the city")

# Plot distribution of NO2
ggplot(data = air_pollution, aes(x = NO2)) +
  geom_histogram(fill = "#66CCCC", bins = 30) +
  scale_x_continuous(name = "NO2 concentration (µg/m³)") +
  scale_y_continuous(name = "Count") +
  ggtitle("Distribution of NO2 in the city")

# Plot scatter plot of PM2.5 and NO2
ggplot(data = air_pollution, aes(x = PM2.5, y = NO2)) +
  geom_point(alpha = 0.5, color = "#FF6666") +
  scale_x_continuous(name = "PM2.5 concentration (µg/m³)") +
  scale_y_continuous(name = "NO2 concentration (µg/m³)") +
  ggtitle("Relationship between PM2.5 and NO2")

# Plot time series of PM2.5
ggplot(data = air_pollution, aes(x = Date, y = PM2.5)) +
  geom_line(color = "#FF6666") +
  scale_x_date(name = "Date") +
  scale_y_continuous(name = "PM2.5 concentration (µg/m³)") +
  ggtitle("Time series of PM2.5 in the city")

# Plot boxplot of PM2.5 by season
air_pollution_season <- air_pollution %>%
  mutate(Season = cut(Date, breaks = "3 months", labels = c("Winter", "Spring", "Summer", "Fall"))) # create season variable
ggplot(data = air_pollution_season, aes(x = Season, y = PM2.5)) +
  geom_boxplot(fill = "#FF6666", alpha = 0.7) +
  scale_x_discrete(name = "Season") +
  scale_y_continuous(name = "PM2.5 concentration (µg/m³)") +
  ggtitle("Seasonal variation in PM2.5")
