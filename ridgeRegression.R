#library(recommenderlab)
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
normData = scale(data, center = TRUE, scale = TRUE)
sdVal = apply(normData,2,sd)
#meanVal = apply(normData,2,mean)
print(sdVal)
#print (meanVal)
#linearRidge(formula, data, lambda = "automatic", nPCs = NULL,scaling = c("corrForm", "scale", "none"), ...)

pcaData = prcomp(normData[,-4],
                 center = TRUE,
                 scale. = TRUE)
print(pcaData)




dat = cbind(data.frame(Y=normData[1:5,4]),as.data.frame(normData[1:5,-4]))
model = linearRidge( Y  ~ .  ,data =  dat , nPCs = 8) 
                     

#summ = summary(model)
#print(summ)

                              
