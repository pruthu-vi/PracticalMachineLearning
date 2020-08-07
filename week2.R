### "Caret" package

### Machine Learning Algorithms in R
# 1. Linear Discriminant Analysis
# 2. Regression
# 3. Naive Bayes
# 4. Support Vector Machine
# 5. Classification & Regression Trees
# 6. Random Forest
# 7. Boosting 
# ... etc.


### Example 1
library(caret)
library(kernlab)
data(spam)

# Data Splitting
inTrain <- createDataPartition(y = spam$type, p = 0.75, list = FALSE)
training <- spam[inTrain, ]
testing <- spam[-inTrain, ]

dim(training)
dim(testing)

# Modeling
set.seed(123)
modelFit <- train(type ~ ., data = training, method = "glm")      #GLM
modelFit
modelFit$finalModel

# Predicting
predictions <- predict(modelFit, newdata = testing)
predictions

# Accuracy check = confusion matrix
confusionMatrix(predictions, testing$type)

## Cross validation
set.seed(124)
dim(spam)
# can use, createFolds, createResample, createTimeSlices
folds <- createFolds(y = spam$type, k = 10,
                     list = TRUE, 
                     returnTrain = TRUE)  # if returnTrain=F => Test set:)
sapply(folds, length)     
folds[[1]][1:10]      
      
## Training options
args(train.default)
args(trainControl)      


## Plotting wages
library(ISLR)
library(ggplot2)
library(grid)
library(gridExtra)
data(Wage)
View(Wage)
str(Wage)
summary(Wage)

set.seed(1234)
inTrain <- createDataPartition(y = Wage$wage, p = .7, list = FALSE)
training <- Wage[inTrain, ]
testing <- Wage[-inTrain, ]
dim(training)
dim(testing)

featurePlot(x = training[, c("age", "education", "jobclass")],
            y = training$wage,
            plot = "pairs")
qplot(x = age, y = wage, data = Wage)
qplot(x = age, y = wage, colour = jobclass, data = training)
qplot(x = age, y = wage, colour = education, data = training) +
      geom_smooth(method = "lm", formula = y~x)

cutWage <- cut(training$wage, breaks = 3)
table(cutWage)
qplot(cutWage, age, data = training, fill = cutWage, geom = c("boxplot")) 
qplot(cutWage, age, data = training, fill = cutWage, geom = c("boxplot", "jitter")) 
grid.arrange(qplot(cutWage, age, data = training, fill = cutWage, geom = c("boxplot")),
             qplot(cutWage, age, data = training, fill = cutWage, geom = c("boxplot", "jitter")),
             ncol = 2)
qplot(wage, col = education, data = training, geom = "density")

# Preprocess - Standardizing
preObj <- preProcess(training[, -58], method = c("center", "scale"))
trainCapAves <- predict(preObj, training[, -58])$capitalAve
mean(trainCapAves)













