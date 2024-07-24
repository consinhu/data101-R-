# Generate an R program, hw5.R that uses the pima data set and the tapply function to report the mean of the diabetes variable among the subset of observations with glucose in the first quartile (Q1) and the mean of the diabetes variable among the subset of observations with glucose in the fourth quartile (Q4). Submit the R program and the text output.

library(faraway)
head(pima)

#Obtain quartiles of glucose
summary(pima$glucose)
# Min. 1st Qu.  Median  Mean   3rd Qu.   Max. 
# 0.0    99.0   117.0   120.9   140.2   199.0
# glucose(Q1) = 99.0 and glucose(Q3) = 140.2

# Check to determine if categorization of glucose values is correct
# table(pima$glucose, pima$Q)
pima$Q = as.factor(cut(pima$glucose,breaks=c(-.1, 99.0, 117.0, 140.2, 199.0)))

tapply(pima$diabetes, pima$Q, mean)
# (-0.1,99]  (99,117] (117,140] (140,199] 
# 0.4338832 0.4293093 0.4936270 0.5329115

#use mean statement to check calculations
#mean of diabetes variable among people with glucose in Q1
mean(pima[(0<=pima$glucose) & (pima$glucose<=99.0),]$diabetes)
# [1] 0.4338832
#mean of diabetes variable among people with glucose in Q4
mean(pima[(140.2<=pima$glucose),]$diabetes)
# [1] 0.5329115