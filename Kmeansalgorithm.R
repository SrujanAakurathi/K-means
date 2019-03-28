library(datasets)
library(ggplot2)
tripDetails <- read.csv("C:/Users/Srujan/Documents/Rfiles/tripDetails.csv", row.names=1)
View(tripDetails)
str(tripDetails)
summary(tripDetails)
tripCluster <- kmeans(tripDetails,3)
tripCluster

k.max <- 10
wss <- rep(NA,k.max)
nClust <- list()
for(i in 1:k.max) {
  driveClasses <- kmeans(tripDetails,i)
  wss[i] <- driveClasses$tot.withinss
  nClust[[i]] <- driveClasses$size
}

plot(1:k.max,wss,type = "b", pch = 19, xlab = "Number of clusters K", ylab = "Total within-clusters sum of squares: Trips")
