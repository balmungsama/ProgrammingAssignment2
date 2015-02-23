makeCacheMatrix <- function(x = matrix()) {
     s <- NULL
#      I honetsly don't know what this does.
     set <- function(y) {
          x <<- y
          s <<- NULL
     }
#      Grabs the matrix
     get <- function() x
#      Solves the matrix
     setinv <- function(solve) s <<- solve
#      Grabs the solved matrix x
     getinv <- function() s
#      Just the output of all the functions to use later
     liz <<- c(set = set, get = get, setinv = setinv, getinv = getinv)
}

cacheSolve <- function(x, ...) {
#      retrieves the solved matrix (or NULL if it's unsolved))
     s <- liz$getinv()
#      Checks to see if s is null or not. If it isn't, it grabs the cached value.
     if(!is.null(s)) {
          message("getting cached data")
          return(s)
     }
#      Grabs the unsvolved matrix
     data <- liz$get()
#      Solves the unsolved matrix and returns it as 's,' like a bauss.
     s <- solve(data, ...)
#      Sets the now solved matrix s into the cache to be used later.
     liz$setinv(s)
#      Returns the solved matrix.
     s
