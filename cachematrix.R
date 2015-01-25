## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix is a function that returns a list of functions, to store a matrix and a cached value of the inverse of the matrix. 
## This function, makeCacheMatrix creates a list containing a function to:
## 1. setMatrix: set the value of the matrix
## 2. getMatrix: get the value of the matrix
## 3. cacheInverse: set the inverse of the matrix(the cached value)
## 4. getInverse: get the inverse of the matrix(the cached value)
make.CacheMatrix <- function(x = matrix()) {
cache<-NULL
## set a matrix, and make sure this matrix is invertable.
setMatrix<-function(matrix){
        x<<-matrix
        cache<<-NULL
}
## get the matrix
getMatrix<-function(){
        x
}
## cache the inverse of the matrix with the solve function in R
cacheInverse<-function(solve){
        cache<<-solve
}
## get the cached value
getInverse<-function(){
        cache
}
## return a list containing functions above
list(setMatrix=setMatrix, getMatrix= getMatrix, cacheInverse=cacheInverse, getInverse= getInverse)
}

## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
## get the cached value
        inverse<- x$getInverse()
## return the value if it has been cached
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
}
## if no cached value, caculate the inverse matrix 
        data<-x$getMatrix()
        inverse<-solve(data)
        x$cacheInverse(inverse)
## return the value
        inverse
}
