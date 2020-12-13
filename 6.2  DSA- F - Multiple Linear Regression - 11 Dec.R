# MULTIPLE LINEAR REGRESSION
housing = read.table("http://www.jaredlander.com/data/housing.csv", sep =",", header = TRUE, stringsAsFactors=FALSE)

# write.table(housing, "Shousing.csv", col.names = TRUE,row.names = FALSE, quote = FALSE, sep =",")
# ?write.table # Help on write table!

View(housing)

str(housing)

housing$Boro= as.factor(housing$Boro)# Boro - Borough - Town with its own Government.

str(housing)

unique(housing$Boro)

head(housing)

names(housing)=c("Neighborhood","Class", "Units", "YearBuilt", "SqFt", "Income", "IncomePerSqFt", "Expense", "ExpensePerSqFt", "NetIncome", "Value", "ValuePerSqFt", "Boro")

tail(housing)

#Response Variable : ValuePerSqFt

# Visulaize the Data
require(ggplot2)
require(lattice)

# Draw Histofgram of ValuePerSqFt
ggplot(housing, aes(x=ValuePerSqFt))+geom_histogram(binwidth=10)+labs(x="Value per Sqare Foot")
ggplot(housing, aes(x=ValuePerSqFt, fill=Boro))+geom_histogram(binwidth=10)+labs(x="Value per Sqare Foot")
ggplot(housing, aes(x=ValuePerSqFt, fill=Boro))+geom_histogram(binwidth=10)+labs(x="Value per Sqare Foot")+facet_wrap("Boro")

# Histogram for Square Footage and Units
ggplot(housing, aes(x=SqFt))+geom_histogram()
ggplot(housing, aes(x=Units))+geom_histogram()
ggplot(housing[housing$Units<1000,], aes(x=SqFt))+geom_histogram()
ggplot(housing[housing$Units<1000,], aes(x=Units))+geom_histogram()
ggplot(housing, aes(x=SqFt, y=ValuePerSqFt))+geom_point()
ggplot(housing, aes(x=Units, y=ValuePerSqFt))+geom_point()
gplot(housing[housing$Units<1000,], aes(x=SqFt, y=ValuePerSqFt))+geom_point()
ggplot(housing[housing$Units<1000,], aes(x=Units, y=ValuePerSqFt))+geom_point()

# How many Housing$Units greater than 1000
sum(housing$Units>=1000)
# Remove Housing$Units greater than 1000
housing=housing[housing$Units<1000,]
# Plot ValuePerSqFt against SqFt
ggplot(housing, aes(x=SqFt, y=ValuePerSqFt))+geom_point()
ggplot(housing, aes(x=log(SqFt), y=ValuePerSqFt))+geom_point()
ggplot(housing, aes(x=SqFt, y=log(ValuePerSqFt)))+geom_point()
ggplot(housing, aes(x=log(SqFt), y=ValuePerSqFt))+geom_point()


# Plot ValePerSqFt against Units
ggplot(housing, aes(x=Units, y=ValuePerSqFt))+geom_point()
ggplot(housing, aes(x=log(Units), y=ValuePerSqFt))+geom_point()
ggplot(housing, aes(x=Units, y=log(ValuePerSqFt)))+geom_point()
ggplot(housing, aes(x=log(Units), y=ValuePerSqFt))+geom_point()

# Fit the Model
house1=lm(ValuePerSqFt~Units+SqFt+Boro, data=housing)
summary(house1)

# To get only Coefficients
house1$coefficients
coef(house1)
coefficients(house1)

# Draw coefficients Plot
install.packages("coefplot")
require(coefplot)
coefplot(house1)

house2=lm(ValuePerSqFt~Units*SqFt+Boro, data = housing)
house3=lm(ValuePerSqFt~Units:SqFt+Boro, data = housing)
house2$coefficients
house3$coefficients

# draw Coef Plot
coefplot(house2)
coefplot(house3)

house4=lm(ValuePerSqFt~ SqFt*Units*Income, data = housing)
house4$coefficients


# Interaction between TWO Categorical variables
house5=lm(ValuePerSqFt~Units:Class*Boro, data = housing)
house5$coefficients

# For ratio, need to use I() function
house6=lm(ValuePerSqFt~ I(SqFt/Units)+Boro, data = housing)
house6$coefficients


house7=lm(ValuePerSqFt~ (Units+SqFt)^2,housing)
house7$coefficients

house8=lm(ValuePerSqFt~Units*SqFt, housing)
house8$coefficients

identical(house7$coefficients, house8$coefficients)

house9=lm(ValuePerSqFt~ I(Units+SqFt)^2,housing)
house9$coefficients

# MULTIPLOT - coefplot
multiplot(house1, house2, house3)

summary(house1)
summary(house2)
summary(house3)
summary(house4)
summary(house5)
summary(house6)
summary(house7)
summary(house9)

housingNew=read.table("http://www.jaredlander.com/data/housingNew.csv", sep =",", header = TRUE, stringsAsFactors=FALSE)
# write.table(housingNew, "Testhousing.csv", col.names = NA,row.names = TRUE, quote = FALSE, sep =",")
# To predict with 95 % confidence bounds
housePredict=predict(house1, newdata=housingNew, se.fit=TRUE, interval="prediction", level=0.95)
head(housePredict$fit)
View(housePredict$fit)

house4Predict=predict(house4, newdata=housingNew, se.fit=TRUE, interval="prediction", level=0.95)
head(house4Predict$fit)
View(house4Predict$fit)
