# A vector is collection of elements of same type.
# (ie) A vector cannot be of mixed type.
# R is a Vectorized Language. Thant means operations are applied to each element of the vector automatically,
# .., without the need to loop through the vector.
# This is a powerful concept and vector plays a crucial and significant role in R.

# Creating Vectors
# The most common way to create a Vector is using 'c' [combine]
x = c(1,2,3,4,5,6,7,8,9,10)
x

# Vector Operations
x*3 # multiplies each element by 3; No loops necessary!
x+2
x-3
x/4
x^2
sqrt(x)

# colon (:)  operation - Sequencing
# Creates sequence of Numbers in either direction!
1:10 #(: - Through)
10:1
-2:3
5:-7

# More on Vector Operations ... Two vectors
# create two vectors of equal length
x = 1:10
y = -5:4
x + y # Add
x-y
x*y
x/y
x^y
# check the length of each vector
length(x)
length(y)
# Unequal length vectors
x+c(1,2) # Shorter vector gets recycled!
x+c (1,2,3)# If Longer vector is not "multiple" of shorter vector, a warning is given!
# Comparison also work on vector!
x <= 5
x<y
# Vector Comparison - "any" and "all"
x = 10:1
y = -4:5
any(x<y)
all(x<y)

# The "nchar" function also acts on each element of vector.
q = c("Hockey","Football","Baseball","Curlin","Rugby","Lacrosse",
      "Basketball","Tennis","Cricket","Soccer")
q
nchar(q)

nchar(y)

?nchar()

# Subscripting:Accessing "individual elements" in vector is done using square brackets []
x[1]
x[1:2]
x[c(1:5,9)]

# Give Names to Vector!
c(One = "a", Two = "y", Last = "r") # Name-Value pair
# You can Name the vector after creating vector as well!
w = 1:3
names(w) = c("a","b","c")
w
