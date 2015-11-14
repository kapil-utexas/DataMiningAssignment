#library(recommenderlab)
library(ridge)
#library(MASS)
#library(FactoMineR)
library(ggplot2)
        

data = read.csv('train.csv',header=TRUE,sep=",")
data$StateHoliday = as.numeric(factor(data$StateHoliday))
data$SchoolHoliday = as.numeric(factor(data$SchoolHoliday))
data$Date = as.numeric(factor(data$Date))
#Z score normlization
normData = scale(data, center = TRUE, scale = TRUE)
sdVal = apply(normData,2,sd)
#linearRidge(formula, data, lambda = "automatic", nPCs = NULL,scaling = c("corrForm", "scale", "none"), ...)

pca = princomp(normData[,-4])
#summary(pca)
#print(pca$loadings)
newData = (pca$scores)
screeplot(pca,type="lines")


#qplot(pca$eig, type="lines")

Y = newData[1:500,4]
dat = cbind(data.frame(Y),as.data.frame(newData[1:500,]) )
model = linearRidge( Y  ~ .  ,data =  dat, nPCs = 6 ) 
summary(model)                     

#summ = summary(model)
#print(summ)

                              
