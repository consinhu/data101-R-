install.packages("EnvStats")
library(EnvStats)

#Set seed to 13245
set.seed(13245)

# Using runif to generate samples taken from a uniform distribution
# runif creates random deviates of a uniform disribution
sample1 <- runif(9, min = 0, max = 1)
sample2 <- runif(9, min = 0, max = 1.3)

#Q-Q plots for each sample
qqnorm(sample1)
qqline(sample1)

qqnorm(sample2)
qqline(sample2)

# Two sample t-test
t_test_result <- t.test(sample1, sample2, var.equal = TRUE)
print(t_test_result)


# Two-sample permutation test
perm_test <- wilcox.test(sample1, sample2, alternative = "two.sided", nperm = 10000)
print(perm_test)

