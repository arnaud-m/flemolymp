##' A dynamic programming algorithm for the Subset Sum Problem
##'
##' This function applies a dynamic programming algorithm for the subset sum problem.
##'
##' @inheritParams GreedySearchSSP
##' @return A numeric vector from dynamic programming, where element `i`
##'   is positive if there exists a combination of items whose total size is `i`.
##'   A positive value indicates that the combination includes the corresponding item.
##' @encoding UTF-8
##' @examples
##' sizes <- c(16, 15, 14, 13, 12, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' DynamicProgrammingSSP(sizes = sizes, capacity = capacity)
##'
##' sizes <- c(15, 14, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' DynamicProgrammingSSP(sizes = sizes, capacity = capacity, tikz = TRUE)
##' @export
DynamicProgrammingSSP <- function(sizes, capacity, tikz = FALSE) {
    capacity <- capacity + 1
    reached <- numeric(capacity)
    reached[1] <- Inf
    for(i in seq_along(sizes)) {
        curInd <- which(reached > 0)
        newInd <- setdiff(curInd + sizes[i], curInd)
        newInd <- subset(newInd, newInd <= capacity)
        reached[newInd] <- i
        if(tikz) ExportTikzDP(reached, sizes, capacity, picY = - 4 * i)
        if(tail(reached, 1) > 0) break
    }
    return(reached)
}
