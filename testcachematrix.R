source("ProgrammingAssignment2/cachematrix.R")

# Make a square-matrix (required to easily solve the matrix)
mat <- matrix(runif(16), c(4, 4))
mat

# Make a Cache-Matrix
cm <- makeCacheMatrix(mat)

# Gets the matrix-data
cm$get()

# Gets the inverse matrix
cm$getinv()

# Cache solve matrix
cacheSolve(cm)
