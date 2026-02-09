##' Extract the solution assignment from the dynamic programming table
##'
##' @param reached A numeric vector from dynamic programming, where element `i`
##'   is positive if there exists a combination of items whose total size is `i`.
##'   A positive value indicates that the combination includes the corresponding item.
##' @param sizes A numeric vector representing the sizes (or weights) of each item (without NAs).
##' @return A logical vector indicating which items are included in the knapsack.
##'   Each element should be \code{TRUE} if the corresponding item is taken, or \code{FALSE}/\code{NA} otherwise.
##' @examples
##' sizes <- c(16, 15, 14, 13, 12, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' reached <- DynamicProgrammingSSP(sizes = sizes, capacity = capacity)
##' solution <- GetSolutionDP(reached, sizes)
##' IsFeasible(solution, sizes, capacity)
##' sizes <- c(15, 14, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' reached <- DynamicProgrammingSSP(sizes = sizes, capacity = capacity)
##' solution <- GetSolutionDP(reached, sizes)
##' IsFeasible(solution, sizes, capacity)
##' @export
GetSolutionDP <- function(reached, sizes) {
    solution <- logical(length(sizes))
    solution[unique(tail(reached, -1))] <- NA
    idx <- tail(which(reached > 0), 1)
    while(idx > 1){
        solution[reached[idx]] <- TRUE
        idx <- idx - sizes[reached[idx]]
    }
    return(solution)
}
