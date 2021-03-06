## Caching the Inverse of a Matrix

## Creating special "matrix" object, caching its inverse.


makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) i <<- inverse
    getInverse <- function() i
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}



## Computing the inverse of the special "matrix" created by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed), 
## then it retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
    i <- x$getInverse()
    if(!is.null(i)){
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setInverse(i)
    i
}
