# We use most of the time "caret" package
# For more advanced ML go for coursera ML course

## Proceed
#     Question
#     Input data
#     Features
#     Algorithm
#     Parameters
#     Evaluation

### First project
# Use kernlab package use data called spam :)

library(kernlab)
data(spam)
View(spam)
dim(spam)
?spam
head(spam)
str(spam)

plot(density(spam$your[spam$type=="nonspam"]),
     col = "blue", xlab = "frequency of 'your'")
lines(density(spam$your[spam$type=="spam"]), col = "red")
abline(v = .5 , col = "black")
legend("topright", legend = c("spam", "non-spam"), fill = c("red", "blue"))

pred <- ifelse(spam$your > 0.5, "spam", "nonspam")
table(pred, spam$type) / length(spam$type)
accuracy <- 0.4590 + .2923
accuracy
