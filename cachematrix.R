## These functions are made for computing and caching inverse matrix

## A wrapper for a matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinversed <- function(inversed) i <<- inversed
  getinversed <- function() i
  list(set = set, get = get,
       setinversed = setinversed,
       getinversed = getinversed)
}


## Computes inverse matrix with caching

cacheSolve <- function(x) {
  i <- x$getinversed()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  message("computing new data")
  data <- x$get()
  i <- solve(data)
  x$setinversed(i)
  i
}
