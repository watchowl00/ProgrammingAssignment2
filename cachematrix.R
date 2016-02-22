## The following functions are used to cache matrix computations
## so the results may be called up later without the need to 
## rerun the computations.

## The following function creates a special "matrix" object that
## can cache the matrix inverse.

makeCacheMatrix <- function(x = matrix()) {

  inv <- Null
  set <- function (y) {
    x <<- y
    inv <<- Null
    
  }
}

{
get <- function () x
setinverse <- function (solve) inv <<- solve
getinverse <- function () inv
list ( set = set, get = get, setinverse = setinverse, 
       getinverse = getinverse)

}


## The following function computes the inverse of the 
## special matrix.  If the inverse has already been computed, and 
## the matrix has not changed, the inverse will be retrived
## from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if (!is.null (inv)) { 
    message ("Retriving Cached Data")
    return (inv)
    
  }
  data <- x$get()
  inv <- solve (data, ...)
  x$setinverse(inv)
  inv
  
}
