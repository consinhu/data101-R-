# Only one categorical variable --> use a chi-squared test of goodness of fit
#Create vectors of observed and expected frequencies
estimated_absences <- c(5, 30, 40, 20, 5)
observed_absences <- c(6, 29, 38, 22, 5)

#Chi-squared test of goodness of fit
chi_square <- chisq.test(observed_absences, p = estimated_absences/sum(estimated_absences))
chi_square