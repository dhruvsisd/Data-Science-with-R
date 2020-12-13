A = matrix(1:10, nrow=5)
B = matrix(21:30, nrow=5)
C = matrix(21:40, nrow=2)

A
B
C

dim(A)
dim(C)

A+B
A*B         # Vector Multiplication
A*C         #Error in A * C : non-conformable arrays
A == B      #Check if elements are equal
A %*% t(B)  #Matrix Multiplication
