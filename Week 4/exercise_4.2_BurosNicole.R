# Assignment: ASSIGNMENT 4.2
# Name: Buros, Nicole
# Date: 2022-03-27

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())
library(dplyr)
library(plyr)
library(readxl)

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/njack/OneDrive/Documents/DSC 520/dsc520")

## Read scores.csv file and create data frame, summarize data and type
scores_df <- read.csv("data/scores.csv")
summary(scores_df)
str(scores_df)

## Create new variables to hold 2 class sections
sports_sec <- scores_df[which(scores_df$Section == "Sports"), names(scores_df) %in% c("Count", "Score")]
head(sports_sec)
reg_sec <- scores_df[which(scores_df$Section == "Regular"), names(scores_df) %in% c("Count", "Score")]
head(reg_sec)

## Use the Plot function to plot each Sections scores and the number 
## of students achieving that score. 
plot(sports_sec$Score, sports_sec$Count, main = 'Sports Section Scores', xlab = 'Score', ylab = 'Count')
plot(reg_sec$Score, reg_sec$Count, main = 'Regular Section Scores', xlab = 'Score', ylab = 'Count')

## Read week-7-housing.xlsx file and create data frame, summarize data and type
excel_sheets('data/week-7-housing.xlsx')
housing_df <- read_excel('data/week-7-housing.xlsx', sheet=1)
summary(housing_df)
str(housing_df)

## Use the apply function on a variable in your dataset
apply(housing_df[ , 15], 2, mean)
## Use the aggregate function on a variable in your dataset
aggregate(bedrooms ~ Sale_Price, housing_df, mean)
## Use the plyr function on a variable in your dataset – more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together
price_diff <- function(data)
{c(price_diff=with(data, (`Sale_Price` - mean(`Sale_Price`))))}
dlply(as.data.frame(housing_df), .variables="bedrooms", .fun=price_diff)
## Check distributions of the data
hist(housing_df$bedrooms)
## Identify if there are any outliers
boxplot(housing_df$bedrooms)
##There are definitely outliers on both ends of the data, as seen with the boxplot



