## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x=matrix(),...){
       m<-NULL
       set<-function(y){
               x<<-y 
               m<<-NULL
       }
       get<-function() x
       setMatrix<-function(solve) m<<-solve
       getMatrix<-function() m
       list(set=set,get=get,setM=setM,getM=getM)
}

#This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
#computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  m <- x$getMatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setM(m)
  m
  ## Return a matrix that is the inverse of 'x'
}
