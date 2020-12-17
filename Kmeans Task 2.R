library(MASS)
library(readr)
library(psych)
library(ggplot2)
library(ggfortify)
library(ggplot)
Data<-read.csv("C:/Users/santu/OneDrive/Desktop/UnSuperviesd data sheet.csv")
head(Data)
ggplot(Data,aes(Data$PetalLengthCm,Data$PetalWidthCm,color=Data$Species))+geom_point()
str(Data)
summary(Data)
describe(Data)
boxplot(Data)
df<-data.frame(Data)
colSums(is.na(df))
View(df)
### Removed a character variable 
df = subset(df, select = -c(Species) )
View(df)
###standardize variables 
df<-scale(df)
summary(df)
describe(df)
str(df)
boxplot(df)
set.seed(20)
Cluster <- kmeans(Data[, 3:4], 3, nstart = 20)
Cluster
###K-means clustering with 3 clusters of sizes 46, 54, 50
table(Cluster$cluster, Data$Species)
setosa versicolor virginica
1      0          2        44
2      0         48         6
3     50          0         0
Cluster$cluster <- as.factor(Cluster$cluster)
ggplot(Data, aes(Data$PetalLengthCm,Data$PetalWidthCm,color = Cluster$cluster)) + geom_point()
###Kmeans###
