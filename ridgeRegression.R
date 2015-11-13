library(recommenderlab)
library(ridge)

data = read.csv('train.csv',header=TRUE,sep=",")
data$StateHoliday = as.numeric(factor(data$StateHoliday))
data$SchoolHoliday = as.numeric(factor(data$SchoolHoliday))
#data$Date = as.numeric((as.POSIXct(factor(data$Date), format="%m/%d/20%Y")))
#Date = (as.POSIXct(data$Date, format="%m/%d/%y"))
#print(Date)
data$Date = as.numeric(factor(data$Date))
#print(Date) 
#Z score normlization
normData = scale(data[,-4], center = TRUE, scale = TRUE)
sdVal = apply(normData,2,sd)
#meanVal = apply(normData,2,mean)
print(sdVal)
#print (meanVal)
#linearRidge(formula, data, lambda = "automatic", nPCs = NULL,scaling = c("corrForm", "scale", "none"), ...)

model = linearRidge(data$Sales[1,2] ~ normData[1,2])
summary(model)


                              
