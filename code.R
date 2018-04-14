#Reading in data
setwd("~/Desktop/Data_Fest")

library(data.table)
datafest=fread("datafest.csv") 

head(datafest)

#anyNA(datafest) 
#False, there isn't any missing values 

names(datafest)
str(datafest)
