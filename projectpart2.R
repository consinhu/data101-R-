library(readr)
library(dplyr)
library(ggplot2)
library(klaR)
library(rpart)
library(rsample)

# Loading training and test data from the credit card transaction & fraud detection dataset
fraudTrain <- read.csv("/Users/consinhu/Rutgers/Spring 2024/Data 101/Homework/archive/fraudTrain.csv")
fraudTest <- read.csv("/Users/consinhu/Rutgers/Spring 2024/Data 101/Homework/archive/fraudTest.csv")
fraudTrain$is_fraud <- as.factor(fraudTrain$is_fraud)


# Visualization of distribution of target variable from column is_fraud
ggplot(fraudTrain, aes(x = is_fraud)) + 
  geom_bar(fill = "red") + 
  labs(title = "Distribution of Credit Card Frauds (0: Non-Fraud, 1: Fraud)",
       x = "Non-Frauds vs. Frauds",
       y = "Count") + 
  theme_minimal()

library(caret)

# Divide data into training and testing sets through partitioning
set.seed(15324)

fraudData_split <- initial_split(fraudTrain, prop = 0.75)
fraudData_split

training <- training(fraudData_split)
summary(training)

test <- testing(fraudData_split)
summary(test)

# rpart
rpart_mod <- rpart(is_fraud ~ merchant + lat + long + merch_lat + merch_long, data = fraudTrain, method = "class")
pred_rpart <- predict(rpart_mod, test, type = "class")

# confusion matrix for rpart
tab_rpart <- table(pred_rpart, test$is_fraud)
caret::confusionMatrix(tab_rpart)

# Naive-Bayes
nb_mod <- NaiveBayes(is_fraud ~ merchant + lat + long + merch_lat + merch_long, data = fraudTrain)
pred_nb <- predict(nb_mod, test)

# confusion matrix for naive bayes
tab_nb <- table(pred_nb$class, test$is_fraud)
caret::confusionMatrix(tab_nb)