##' A dynamic programming algorithm for counting solutions of the Subset Sum Problem
##'
##' This function applies a dynamic programming algorithm for counting the solutions of the subset sum problem.
##'
##' @inheritParams GreedySearchSSP
##' @return The positive number of solutions of the problem instance.
##' @encoding UTF-8
##' @examples
##' sizes <- c(16, 15, 14, 13, 12, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' DynamicProgrammingEnumSSP(sizes = sizes, capacity = capacity)
##'
##' sizes <- c(15, 14, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' DynamicProgrammingEnumSSP(sizes = sizes, capacity = capacity)
##' @export
DynamicProgrammingEnumSSP <- function(sizes, capacity) {
    capacity <- capacity + 1
    reached <- numeric(capacity)
    reached[1] <- 1
    for(i in seq_along(sizes)) {
        curInd <- which(reached > 0)
        newInd <- curInd + sizes[i]
        feasInd <- newInd <= capacity
        curInd <-curInd[feasInd]
        newInd <-newInd[feasInd]
        reached[newInd] <- reached[newInd] + reached[curInd]
    }
    return(reached[capacity])
}
