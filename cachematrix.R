## Put comments here that give an overall description of what your
## functions do

##  two functions are created to enable the creation of the inverse
## square invertible matrix and saves it as a cached object

## Function 1
## makeCacheMatrix creates a special 'matrix' object that can
## cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
 ## setter function to populate the local variables for use in the getter function
       set <- function(y){
               x <<- y
               m <<- NULL
       }
## getter function - 
       get <- function() x
       setInverse <- function(solve) m <<- solve
       getInverse <- function() m
       list (set = set, 
             get = get,
             setInverse = setInverse, 
             getInverse = getInverse)

}

## Function 2
## cacheSolve computes the inverse of the special matrix returned
## by makeCacheMarix.  If the inverse has already been calculated
## (and the matrix has not changed), then the cashesolve retrieves
## the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' using getter function
        m <- x$getInverse()
        
        if (!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        
        ##makeCacheMatrix.object$setInverse(m.local.calculated)
        m
}
j <- matrix(1:4,2,2)
myMatrix <- makeCacheMatrix(j)
cacheSolve(myMatrix)





