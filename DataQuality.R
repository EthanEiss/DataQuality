#Data Quality report generations and preprocessing 1
install.packages("~/Spring 22/Capstone/HW1/dataQualityR_1.0.tar.gz", repos = NULL, type = "source")
install.packages("fastDummies")
install.packages("mice")
install.packages("e1071")
install.packages("caret")
install.packages("corrplot")

#read in data
rm(list=ls())
setwd('C:\\Users\\ethan\\OneDrive\\Documents\\Spring 22\\Capstone\\HW1')

df <- read.csv("HW1-des_moines_housing.csv",
               stringsAsFactors = FALSE, na.strings = c("NA", ""))


names(df)



################################################################################
#Create Data Quality report in working directory
library(dataQualityR)
num.file <- paste(getwd(), "/dqames_num.csv", sep= "")
cat.file <- paste(getwd(), "/dqames_cat.csv", sep= "")
checkDataQuality(data= df, out.file.num= num.file, out.file.cat= cat.file)

#Change numeric to categorical 
class(df$MS.SubClass)
df$MS.SubClass
df$MS.SubClass = as.factor(df$MS.SubClass)
class(df$MS.SubClass)
levels(df$MS.SubClass)

#Remove Order, not needed 
df$Order=NULL

num.file <- paste(getwd(), "/dqames_num.csv", sep= "")
cat.file <- paste(getwd(), "/dqames_cat.csv", sep= "")
checkDataQuality(data= df, out.file.num= num.file, out.file.cat= cat.file)