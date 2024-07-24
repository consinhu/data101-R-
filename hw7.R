seniorvoters <- c(rep(1, 30), rep(0, 20)) # where 1 shows favor and 0 shows no favor
youngervoters <- c(rep(1, 40), rep(0, 10))

# Prop test for confidence interval
confidence <- prop.test( x = c(sum(seniorvoters), sum(youngervoters)), n = c(length(seniorvoters), length(youngervoters)), correct = FALSE, conf.level = 0.95)
print(confidence)

# Prop test for p value
pvalue <- prop.test(x = c(sum(seniorvoters), sum(youngervoters)), n = c(length(seniorvoters), length(youngervoters)), correct = FALSE)

#Set Seed
set.seed(23415)

# Two-sample permutation test
twoSamplePermutationTestProportion(seniorvoters, youngervoters, alternative = "two.sided")

