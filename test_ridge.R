library(MASS)
names(longley)[1] <- "y"
fit <- lm.ridge(y ~ ., longley, lambda = seq(0.001, .5, .001))
library(ggplot2)
library(broom)
td <- tidy(fit)
head(td)
ggplot(td, aes(lambda, estimate, color = term)) + geom_line()