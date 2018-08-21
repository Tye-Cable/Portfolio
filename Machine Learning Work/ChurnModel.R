ChurnData <- read.csv("WA_Fn-UseC_-Telco-Customer-Churn.csv")
#Analyzing the dataset
head(ChurnData)
str(ChurnData)
summary(ChurnData)
modeldata = ChurnData[, 2:21]
library(caTools)
set.seed(1)
# Creating test and training data
split = sample.split(modeldata$Churn, SplitRatio = .80)
training_set = subset(modeldata, split == TRUE)
test_set = subset(modeldata, split == FALSE)
# Feature scaling
training_set[,c("tenure","MonthlyCharges","TotalCharges")] = 
  scale(training_set[,c("tenure","MonthlyCharges","TotalCharges")])
test_set[,c("tenure","MonthlyCharges","TotalCharges")] = 
  scale(test_set[,c("tenure","MonthlyCharges","TotalCharges")])
# Fitting LR to Training Set
classifier = glm(formula = Churn ~ .,
                 family = binomial,
                 data = training_set)
# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-20])
prob_pred
y_pred = ifelse(prob_pred > 0.5, "Yes", "No")
y_pred
cm = table(test_set[, 20],y_pred)
cm
