# Assignment: ASSIGNMENT 4.2
# Name: Buros, Nicole
# Date: 2022-03-27

## Load the ggplot2 package
library(readxl)
library(dplyr)
library(purrr)

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/njack/OneDrive/Documents/DSC 520/dsc520")
## Read week-7-housing.xlsx file and create data frame, summarize data and type
excel_sheets('data/week-7-housing.xlsx')
housing_df <- read_excel('data/week-7-housing.xlsx', sheet=1)
summary(housing_df)
str(housing_df)
## Use dplyr - GroupBy, Summarize, Mutate, Filter, Select, and Arrange
housing_df %>% 
  group_by(Sale_Date) %>%
  summarise(AvgPrice=mean(Sale_Price)) %>% mutate(AvgPrice) %>% arrange(AvgPrice)
housing_df %>% filter(bedrooms=='3') %>% select(Sale_Price)

## Using the purrr package – perform 2 functions on your dataset
housing_df %>% map_dbl(mean)
housing_df %>% map(mean)

## Use the cbind and rbind function on your dataset
mult_bedrooms <- housing_df$Sale_Price > 600000
mean_sp <- c(mean(housing_df$Sale_Price))
housing_df <- rbind(mean_sp)
tail(housing_df)

## Split a string, then concatenate the results back together
fav_veg <- c("cucumbers and tomatoes and spinach")
strsplit(fav_veg, " and ")


