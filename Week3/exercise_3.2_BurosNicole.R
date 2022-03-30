# Assignment: ASSIGNMENT 3
# Name: Buros, Nicole
# Date: 2022-03-27

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/njack/OneDrive/Documents/DSC 520/dsc520")

## Load the file
survey_df <- read.csv("data/acs-14-1yr-s0201.csv")
summary(survey_df)
str(survey_df)
nrow(survey_df)
ncol(survey_df)

## Create a histogram of the `HSDegree` variable using `geom_histogram()`
## Select proper number of bins, set titles
ggplot(survey_df, aes(HSDegree)) + geom_histogram(binwidth = 1) + 
  ggtitle('Percentage of Americans w HS Degree per County') + 
  xlab('HS Level Degree (% of Population)') + ylab('Counties (Count)') 

## Create a probability plot of the `HSDegree` variable using `geom_density()`
ggplot(survey_df) + geom_density(aes(HSDegree))

## Quantify normality with numbers using the stat.desc() functio
library(pastecs)
stat.desc(survey_df[,7])
library(e1071)
kurtosis(survey_df[,7])


