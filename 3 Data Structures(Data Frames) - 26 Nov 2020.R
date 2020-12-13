# Sometimes data requires more complex storage than simple vectors.
# Data Structures - Apart from Vectors, we have Data Frames, Matrix, List and Array.

# Data Frames(DF) - Most useful features of R & also cited reason for R's ease of use.
# In dataframe, each column is actually a vector, each of which has same length.
# Each column can hold different type of data.
# Also within each column, each element must be of same type, like vectors.

# Creating a Dataframe from vectors

x = 10:1
y = -4:5
q = c("Hockey","Football","Baseball","Curlin","Rugby","Lacrosse",
      "Basketball","Tennis","Cricket","Soccer")
theDF = data.frame(x,y,q) # this would create a 10x3 data.frame with x, y and q as variable names
theDF

# Assigning Names
theDF = data.frame (First=x, Second =y, Sport = q)
theDF

# Checking the dimensions of the DF.
nrow(theDF)
ncol(theDF)
dim(theDF)
names (theDF)
names(theDF)[3]
rownames(theDF)

# Head and Tail
head(theDF)
head(theDF, n=7)
tail(theDF)

class(theDF)

# Accessing Individual Column using $
theDF$Sport # gives the third column named Sport

# Accessing Specific row and column
theDF[3,2] # 3rd row and 2nd Column
theDF[3,2:3] # 3rd Row and column 2 thru 3
theDF[c(3,5), 2]# Row 3&5 from Column 2; 
# since only one column was selected, it was returned as vector and hence no column names in output.

# Rows 3&5 and Columns 2 through 3
theDF[c(3,5), 2:3]

theDF[ ,3] # Access all Rows for column 3
theDF[ , 2:3]

theDF[2,]# Access all columns for Row 2
theDF[2:4,]
theDF[ , c("First", "Sport")]# access using Column Names

