# Assignment: Working with R and Git
# Author: Daniel Drasler
# Data source: Food Delivery Time Prediction Dataset (Kaggle)
# https://www.kaggle.com/datasets/dharmendrapandit12/food-delivery-time-prediction-dataset

# 1. Import the dataset
delivery <- read.csv("Food_Delivery_Time_Prediction.csv")
str(delivery)

# 2. Descriptive statistics: quantitative variables
summary(delivery[, c("Time_taken_min", "Road_Distance_km", "Preparation_Time_Min")])

# 3. Descriptive statistics: categorical variables
table(delivery$Traffic_Level)
table(delivery$Weather)
round(100 * prop.table(table(delivery$Traffic_Level)), 1)
round(tapply(delivery$Time_taken_min, delivery$Traffic_Level, mean), 1)

# 4. Transformations
# Log transform delivery time (numeric variable is right-skewed)
delivery$log_time <- log(delivery$Time_taken_min)
head(delivery[, c("Time_taken_min", "log_time")])

# Collapse weather into a two-level adverse/clear indicator
delivery$adverse_weather <- factor(ifelse(delivery$Weather %in% c("Rain", "Storm", "Fog"), 
                                          "Adverse", "Clear/Cloudy"))
table(delivery$adverse_weather)

# 5. Plots
# Histogram
hist(delivery$Time_taken_min,
     main = "Distribution of Delivery Time",
     xlab = "Delivery time (minutes)",
     col = "steelblue")

# Scatterplot
plot(delivery$Road_Distance_km, delivery$Time_taken_min,
     main = "Delivery Time vs. Road Distance",
     xlab = "Road distance (km)",
     ylab = "Delivery time (minutes)",
     pch  = 19,
     col  = rgb(0.2, 0.4, 0.7, 0.2))

