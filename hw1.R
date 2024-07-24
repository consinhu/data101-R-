# HW01: Generate an R program and name it hw1.R  that creates a character vector, c1,  with 7 values and 2 numeric vectors, v1 and v2, with 7 values each. Use the cbind() statement to create a data frame named hw1. Add a 4th variable to hw1, v3,  that adds the 2 numeric vectors together.  Include program statements in hw1.R that find the minimum of v3 and the maximum of v3. Submit the R program and the text output.

#character vector
c1 <- c("banana", "orange", "apple", "strawberry", "grape", "mango", "pear")
#numeric vectors
v1 <- c(1, 2, 3, 4, 5, 6, 7)
v2 <- c(8, 9, 10, 11, 12, 13, 14)
#data frame
hw1 <- cbind(c1, v1, v2)
#fourth numeric vector
v3 <- v1 + v2
#adding fourth vector to hw1
hw1 <- cbind(c1, v1, v2, v3)
#checking data
head(hw1)
     c1           v1  v2   v3  
[1,] "banana"     "1" "8"  "9" 
[2,] "orange"     "2" "9"  "11"
[3,] "apple"      "3" "10" "13"
[4,] "strawberry" "4" "11" "15"
[5,] "grape"      "5" "12" "17"
[6,] "mango"      "6" "13" "19"
min(v3)
[1] 9
max(v3)
[1] 21