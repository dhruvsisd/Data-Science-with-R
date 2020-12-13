x=10
class(x)

i=5L  #L is for integer
class(i)
is.integer(i)
is.integer(x)

s= "R_studio"
class(s)

#Levels of classification - Factor---Involves levels (Ordinal)
#Ex: Educational classification - X, XII, Grad, PG

#Logical - True (1) and False (0)
TRUE*5
FALSE*5

K = TRUE
class(K)
is.logical(K)

#Date - STarting Date(1970) - Numeric value
# POSIXct - Date plus Time
date=as.Date("2020-11-22")
date
as.numeric(date)

date1= as.POSIXct("2020-11-22 10:30")
date1
as.numeric(date1)
class(date1)

# Vector - R is called as Vectorized Language
v = c(1,2,3,4,5)
s = v*2
s

#Vector is collection of elements, all of same type
sqrt(s)
