##
## Caching the Inverse of a Matrix.
## file: 'cachematrix.R'
## date: 2018-12-26
##
## description:
## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than compute 
## it repeatedly.
##

## This function creates a special "matrix" object that can cache its inverse.
## Parameter: x = square-matrix (àssume: matrix is invertible with `solve`)
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
            x <<- y
            i <<- NULL
        }
        get <- function() x
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## This function computes the inverse of the special "matrix" returned by 
## `makeCacheMatrix` above. If the inverse has already been calculated 
## (and the matrix has not changed), then the `cachesolve` should retrieve 
## the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinv(i)
        i
}
