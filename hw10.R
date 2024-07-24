#Chi-Square Test of Independence
observed <- matrix(c(200688, 201087, 24, 27, 33, 115), nrow = 2, ncol = 3)
observed
chi_sq_test <- chisq.test(observed)
print(chi_sq_test)

# Permutation Test of Independence
vaccinated <- c(200688, 24, 33)
placebo <- c(201087, 27, 115)
stuff <- rbind(vaccinated, placebo)
dimnames(stuff) <- list(vaccinationstatus = c("Vaccinated", "Placebo"), vaccineresults = c("Did not contract Polio", "Contracted Nonparalytic Polio", "Contracted Paralytic Polio"))
stuff
stuffT <- as.table(stuff)
stuffDF <- as.data.frame(stuffT)
head(stuffDF)
DFL <- vcdExtra::expand.dft(stuffDF)
head(DFL)
num_permutations <- 2000
result <- numeric(num_permutations)
set.seed(2)
for(i in 1:num_permutations) {
  T2 <- xtabs(~sample(vaccinationstatus) + vaccineresults, data = DFL)
  result[i] <- chisq.test(T2)$statistic
}
observed2 <- chisq.test(xtabs(~ vaccinationstatus + vaccineresults, data = DFL))$statistic
pvalue <- (sum(result >= observed2) + 1)/(num_permutations + 1)
pvalue


