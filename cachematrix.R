## This pair of functions illustrates caching the inverse of a matrix

## The first function creates an R object that stores a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
      set <- function(y) {
      	x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(inverse) m <<- inverse
      getinverse <- function() m
      list(set = set, get = get,
      	setinverse = setinverse,
            getinverse = getinverse)
}


## The second function takes the output from the first and retrieves any
## cached inverse (from the first function's environment)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
      if(!is.null(m)) {
      	message("getting cached data")
                return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}
