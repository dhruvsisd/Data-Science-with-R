# T-tests
# Dataset: Tips dependents on...
data(tips, package = "reshape2")
head(tips)
str(tips)
write.csv(tips, "C:/Users/sridhar.v/Documents/IMTG DSA-F/5 DSA Basic Statistics - EDA/tips.csv", row.names = FALSE)

# Gender
unique(tips$sex)
#Day of the week
unique(tips$day)

#One Sample t-test - ONE GROUP [Two Tail. Ho:Mean = 2.5]
t.test(tips$tip, alternative = "two.sided", mu=2.5)

#One Sample t-test - Upper Tail. Ho:Mean LE 2.5
t.test(tips$tip, alternative = "greater", mu=2.5)

# Two Sample T-test - TWO GROUP
t.test(tip ~ sex, data = tips, var.equal = TRUE)

#Paired Two-Sample T-Test 
# Dataset: Heights of Father and Son (Package:UsingR)
install.packages("UsingR")
require(UsingR)
head(father.son)
write.csv(father.son, "C:/Users/sridhar.v/Documents/IMTG DSA-F/5 DSA Basic Statistics - EDA/father_son.csv", row.names = FALSE)

#ANOVA  - Comparing Multiple Groups
# Tip by the Day of the Week
str(tips)
tipAnova = aov(tip ~ day, tips)
summary(tipAnova)
