#=======================================
#Source Code for Group Assignment
#Authors: Noah Angara, Giovanni Magagnin
#November 2020
#=======================================
library(ggplot2)
library(dplyr)
library(stats)
library(stargazer)

## Setting working directory and loading in data
load("insurance-all.Rdata")

## counting numbers of observations and covariates (if charges are dependent variable)
n_obs <- nrow(data)
n_cov <- ncol(data)-1

## highest number of children covered by one health insurance
max_child <- max(data$children)

## calculating region share of smokers
northeast <- data[which(data$region == "northeast" & data$smoker == "yes"),]
smoker_ne <- nrow(northeast)/nrow(data[which(data$region == "northeast"), ])

northwest <- data[which(data$region == "northwest" & data$smoker == "yes"),]
smoker_nw <- nrow(northwest)/nrow(data[which(data$region == "northwest"), ])

southeast <- data[which(data$region == "southeast" & data$smoker == "yes"),]
smoker_se <- nrow(southeast)/nrow(data[which(data$region == "southeast"), ])

southwest <- data[which(data$region == "southwest" & data$smoker == "yes"),]
smoker_sw <- nrow(southwest)/nrow(data[which(data$region == "southwest"), ])

## lowest smoker region
which.min(data.frame(smoker_ne, smoker_nw, smoker_se, smoker_sw))

## creating scatter plot
ggplot(data = data, aes(x = age, y = charges, shape = smoker, color = smoker))+ geom_point()+
ggtitle("Scatterplot: Charges v. Age") +
  theme(plot.title = element_text(hjust = 0.5))

