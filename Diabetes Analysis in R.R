setwd("C:\\Users\\Asus\\OneDrive\\Desktop\\data analysis\\Healthcare analyst\\Diabetes project")
getwd()
install.packages("skimr")
data <- read.csv("Diabetes_012 - diabetes_012_health_indicators_BRFSS2015.csv")
head(data)
library(tidyverse)
summary(data)
library(skimr)
skim(data)
table(data$Diabetes_012)

data %>%
  group_by(Diabetes_012) %>%
  summarise(count = n())

table(na.omit(data$Diabetes_012))



#DATA CLEANING
colSums(is.na(data))

sapply(data, function(x) length(unique(x)))

data$Diabetes_012 <- as.factor(data$Diabetes_012)


#VISUALIZATION

ggplot(data, aes(x = Diabetes_012))+
  geom_bar(fill = "#2c7fb8")+
  labs(title = "Diabetes status distribution", x = "status", y = "count")

ggplot(data, aes(x = Diabetes_012, y = BMI, fill = Diabetes_012))+
  geom_boxplot()+
  labs(title = "BMI by diabetes status")

#Summary statistics by group

data %>%
  group_by(Diabetes_012) %>%
  summarise(
    AVG_BMI = mean(BMI),
    avg_physhlth = mean(PhysHlth),
    avg_menthlth = mean(MentHlth)
    
  )

