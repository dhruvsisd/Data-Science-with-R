# Basic Statistics - Mean, Variances,Correlations and T-tests

# Generate a random sample of 100 numbers between 1 and 100
x = sample(x=1:100, size = 20, replace = TRUE)
x # the output of "x" is a vector of data

# Simple Arithmetic Mean
mean(x)

# Calculate Mean when Missing Data is found
y = x # copy x to y
y[sample(x=1:100, size = 20, replace = FALSE )] = NA # Null Values
y
y = sample(x=1:100, size = 20, replace = FALSE) 
y

mean(y)# Will give NA!

# Remove missing value(s)and calculate mean
mean(y, na.rm=TRUE) # Now, it will give the mean value

# Weighted Mean
Grades = c(95,72,87,66)
Weights = c(1/2, 1/4, 1/8, 1/8)
mean(Grades)# Simple Arithmetic mean
weighted.mean(x = Grades, w = Weights)# Weighted Mean

#Variance
var(x)
#Calculating Variance using formula!
sum((x-mean(x))^2)/ (length(x)-1)

# Standard Deviation
sqrt(var(x))
sd(x)
sd(y)
sd(y, na.rm=TRUE)

# Other Commonly Used Functions
min(x)
max(x)
median(x)
min(y)
min(y, na.rm=TRUE)

# Summary Statistics
summary(x)
summary(y)

# Quantiles
quantile(x, probs = c(0.25, 0.75)) # Calculate 25th and 75th Quantile
quantile(x, probs = c(0.1,0.25,0.5, 0.75,0.99))

quantile(y, probs = c(0.25, 0.75)) # Calculate 25th and 75th Quantile
quantile(y, probs = c(0.25, 0.75), na.rm = TRUE)

# Correlation and Covariance
install.packages("ggplot2")
library(ggplot2)# require(ggplot2)
head(economics)# Built-in dataset in ggplot2 package
cor(economics$pce, economics$psavert) #pce-Personal Consumption Expenditure;psavert -Personal Savings Rate

# To compare correlation for Multiple variables
cor(economics[, c(2,4:6)])

# Display Correlation in Different Format!

# Lets install the required package and load them onto this R environment for executing!!!

# Load the "reshape" package
install.packages("reshape2")
require(reshape2)
# Also load the Scales package for some extra plotting features
install.packages("scales")
library(scales)

econCor = cor(economics [ , c(2,4:6)])
# use "melt()" to change into long format
?melt() # Help on melt function
econMelt = melt(econCor, varnames = c("x" ,"y"), value.name = "Correlation")
# Order it according to correlation
econMelt = econMelt[order(econMelt$Correlation),]
# Display the melted data
econMelt

# Let's Visualize Correlation
## Plot it with ggplot
# Initialize the plot with x and y on the respective axes
ggplot(econMelt,aes (x=x, y=y),geom_tile(aes(fill = Correlation)),scale_fill_gradient2(low = muted("red"), mid = "white", high = "steelblue",guide = guide_colorbar(ticks=FALSE, barheight=10), limit=c(-1,1), theme_minimal(), labs(x= NULL, y=NULL)))
