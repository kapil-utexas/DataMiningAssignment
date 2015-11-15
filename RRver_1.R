#library(recommenderlab)
library(ridge)
library(MASS)
#library(FactoMineR)
library(ggplot2)
library(broom)


data = read.csv('train.csv',header=TRUE,sep=",")
data$StateHoliday = as.numeric(factor(data$StateHoliday))
data$SchoolHoliday = as.numeric(factor(data$SchoolHoliday))
data$Date = as.numeric(factor(data$Date))
#Z score normlization
normData = scale(data, center = TRUE, scale = TRUE)

#sdVal = apply(normData,2,sd)
#linearRidge(formula, data, lambda = "automatic", nPCs = NULL,scaling = c("corrForm", "scale", "none"), ...)

#pca = princomp(normData[,-4])
#summary(pca)
#print(pca$loadings)
#newData = (pca$scores)
#screeplot(pca,type="lines")


#qplot(pca$eig, type="lines")





set.seed (123)
num_row = 0.8 *nrow(normData)
num_test = num_row+1
Y = normData[1:num_row,4]
Yout = normData[num_test:nrow(normData)]

dat = cbind(data.frame(Y),as.data.frame(normData[1:num_row,-4]) )
testdat = cbind(data.frame(Yout),as.data.frame(normData[num_test:nrow(normData),-4]) )
#ridge = lm.ridge(Y ~ ., dat, lambda = seq(0.001,0.05,0.001))
ridge = lm.ridge(Y~ ., dat, lambda = seq(0,100,1))
#ridge = linearRidge(y ~ ., data,nPCs = NULL)
#plot(ridge)
#summary(ridge)
#plot(ridge)
select(ridge)
td = tidy(ridge)
head(td)
ggplot(td, aes(lambda, estimate, color = term)) + geom_line()

#print(summary(model))                     

#summ = summary(model)
#print(summ)


