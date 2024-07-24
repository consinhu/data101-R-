# Generate an R program, hw4.R that uses the pima data set to create a data frame that consists of all observations with test=0. Compute the mean of the diabetes variable. Create a second data frame that consists of allobservations with test=1. Compute the mean of the diabetes variable. Submit the R program and the text output.

library(faraway)
head(pima)

# Creation of first data frame 
test0 <- subset(pima, test == 0)
df1 <- data.frame(test0)
head(df1)
   pregnant glucose diastolic triceps insulin  bmi diabetes age test
2         1      85        66      29       0 26.6    0.351  31    0
4         1      89        66      23      94 28.1    0.167  21    0
6         5     116        74       0       0 25.6    0.201  30    0
8        10     115         0       0       0 35.3    0.134  29    0
11        4     110        92       0       0 37.6    0.191  30    0
13       10     139        80       0       0 27.1    1.441  57    0
# Mean of diabetes variable in df1
mean(df1$diabetes)
[1] 0.429734

# Creation of second data frame
test1 <- subset(pima, test == 1)
df2 <- data.frame(test1)
head(df2)
   pregnant glucose diastolic triceps insulin  bmi diabetes age test
1         6     148        72      35       0 33.6    0.627  50    1
3         8     183        64       0       0 23.3    0.672  32    1
5         0     137        40      35     168 43.1    2.288  33    1
7         3      78        50      32      88 31.0    0.248  26    1
9         2     197        70      45     543 30.5    0.158  53    1
10        8     125        96       0       0  0.0    0.232  54    1
# Mean of diabetes variable in df2
mean(df2$diabetes)
[1] 0.5505