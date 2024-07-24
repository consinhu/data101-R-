library(rpart)

library(readr)
EarningsTrain <- read.csv("Rutgers/Spring2024/Data 101/Homework/EarningsTrain.csv")
library(readr)
EarningsTest <- read.csv("Rutgers/Spring2024/Data 101/Homework/EarningsTest.csv")

pred.Earnings <- rpart(Earnings ~ GPA + Number_Of_Professional_Connections + Major, data = EarningsTrain, method = "anova", control = rpart.control(cp = 0.00000000000000005))

EarningsTest$pred.Earnings <- predict(pred.Earnings, newdata = EarningsTest)

MSE <- mean((EarningsTrain$Earnings - predict(pred.Earnings))^2)

write.csv(EarningsTest, "Predicted Earnings", row.names = FALSE)

print(paste("Mean Squared Error(MSE):", MSE))

#Write EarningsTest csv file with new predEarnings column to original EarningsTest file
write.csv(EarningsTest, "/Users/consinhu/Rutgers/Spring 2024/Data 101/Homework/EarningsTest.csv", row.names = FALSE)