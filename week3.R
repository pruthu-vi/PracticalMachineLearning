library(caret)
library(ggplot2)

data(iris)
head(iris)
dim(iris)

inTrain <- createDataPartition(y = iris$Species, p = 0.7, list = FALSE)
training <- iris[inTrain, ]
testing <- iris[-inTrain, ]
dim(training)
dim(testing)

qplot(Petal.Width, Sepal.Width, col = Species, data = training)

modFit <- train(Species ~ ., method = "rpart", data = training)
print(modFit$finalModel)

plot(modFit$finalModel, uniform = TRUE, main = "Classification Tree")
text(modFit$finalModel, use.n = TRUE, all = TRUE, cex = .8)
