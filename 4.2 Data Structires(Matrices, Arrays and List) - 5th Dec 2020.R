#Matrices
A = matrix(1:10, nrow=5)
rownames(A)=c("1st","2nd","3rd","4th","5th")
A
colnames(A)=c("col-1","col-2")
A

#Arrays
theArray= array(1:12,dim=c(2,3,2))
theArray
#_,_,1  First blank is row, then column then dimension
theArray1= array(1:12,dim=c(2,3,3))
theArray1 # Repeat values after ends for the dimensions

theArray[1,,]
dim(theArray[1,,])

theArray[,1,]
dim(theArray[,1,])

theArray[,,1]
dim(theArray[,,1])

#Lists
list(1,2,3)
list

list1=list(c(1,2,3),4:10)  #2 elements in the list
list1

x = 10:1
y = -4:5
q = c("Hockey","Football","Baseball","Curlin","Rugby","Lacrosse",
      "Basketball","Tennis","Cricket","Soccer")
theDF = data.frame(x,y,q) # this would create a 10x3 data.frame with x, y and q as variable names
theDF

list2=list(theDF,1:10,list1)
list2

list2= list(DataFrame = theDF,Vector=1:10,List=list1)
list2
