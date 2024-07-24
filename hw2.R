# HW02: Generate an R program, hw2.R that uses the pima data set from the faraway library to generate at least 1 one-way table, 1 two-way table, and 1 subset operation. Generate a one-way table and a two-way table on the subset you generated. Place simple line comments before each table generation (using the # character) to indicate the table you generate so the output is clear to the Grader. Submit the R program and the text output.
# HINT: use this version of the subset command to restrict the data set to women who tested negative for diabetes.
#HW02sub=subset(pima,test==0) 
# head(HW02sub)
# Also, keep in mind that continuous variables such as bmi and diastolic blood pressure do not make good candidates for one-way and two-way tables due to the large number of different values for these variables. List ~25 observations to explore the data to determine reasonable choices of variables for tables.

library(faraway)
head(pima)

#One-way table of diabetes
onewaytable <- table(pima$diabetes)
head(onewaytable)
0.078 0.084 0.085 0.088 0.089 0.092 
    1     1     2     2     1     1
    
#Two-way table of diabetes and pregnant
twowaytable <- table(pima$diabetes, pima$test)
head(twowaytable)
      0 1
0.078 1 0
0.084 1 0
0.085 2 0
0.088 1 1
0.089 1 0
0.092 1 0

#Subset of test = 1
HW02sub <- subset(pima, test == 1)
head(HW02sub)
   pregnant glucose diastolic triceps insulin bmi diabetes age test
4         1      89        66      23      94 28.1    0.167  21    0
7         3      78        50      32      88 31.0    0.248  26    1
8        10     115         0       0       0 35.3    0.134  29    0
21        3     126        88      41     235 39.3    0.704  27    0
24        9     119        80      35       0 29.0    0.263  29    1
28        1      97        66      15     140 23.2    0.487  22    0

#One-way table of triceps
onewaytable2 <- table(HW02sub$triceps)
head(onewaytable2)
 0  8 10 11 12 13 
83  1  5  5  4 11

#Two-way table of triceps and test
twowaytable2 <- table(HW02sub$triceps, HW02sub$test)
head(twowaytable2)
    0  1
0  61 22
8   1  0
10  5  0
11  5  0
12  4  0
13 10  1