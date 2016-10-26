## Coursera : DataScience Specialization
## Course   : R Programming
## Activity : Week-2 Assignment-2
## Author   : Marcelo Dominguez


## Sample Run
# matrix <- makeCacheMatrix()
# matrix$set(matrix(c(10,11,12,13,14,15,16,17,18), 3, 3))
# matrix$get()
# acheSolve(matrix)



## Function: 'makeCacheMatrix'
## Receives a matrix and sets its variables and functions in memory.
##
## Returns: a list of functions nested within 'makeCacheMatrix'

makeCacheMatrix <- function(x = matrix()) {
	local_matrix = NULL
  	# setter function
  	set <- function(y) {
    	cache_x <<- y
    	cache_m <<- NULL
  	}
  	# getter function
  	get<-function() { cache_x }
  	# sets the value of cache_m in cache to the value of local_m passed
  	set_cache_matrix <- function(local_matrix) { cache_m <<- local_matrix }
  	# function that retrieves the value of cache_m from cache and returns cache_m to the caller
  	get_cache_matrix <- function() { cache_m }
  
  	list(set = set, get = get, set_cache_matrix = set_cache_matrix, get_cache_matrix = get_cache_matrix) 
}


## Funtion     : 'cacheSolve'
## Receives a matrix and returns its inverse matrix.
## 
## 				 
## Returns     :  a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  	# receives a matrix into 'x' parameter
  	local_matrix <- x$get_cache_matrix()
  	# local_matrix is not  NULL	
  	if (!is.null(local_matrix)) {
    	return(local_matrix)
  	} 
  	# getting matrix to be inverted 
  	in_matrix = x$get()
  	# inverting input matrix
  	out_matrix = solve(in_matrix)
  	# setting cache
  	x$set_cache_matrix(out_matrix)
  	# res
  	out_matrix
}
