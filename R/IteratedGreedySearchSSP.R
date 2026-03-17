##' Iterated Greedy Search for the Subset Sum Problem
##'
##' This function applies the multiple times iterated greedy search algorithm for the subset sum problem.
##'
##' @inheritParams GreedySearchSSP
##' @param iterations  A single numeric value that gives the maximal number of iterations
##' @encoding UTF-8
##' @examples
##' sizes <- c(16, 15, 14, 13, 12, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' solution <- IteratedGreedySearchSSP(sizes = sizes, capacity = capacity)
##' IsFeasible(solution, sizes, capacity)
##'
##' sizes <-  c(16, 15, 14, 10, 9, 8, 6, 5, 3)
##' capacity <- sum(sizes) %/% 2
##' solution <- IteratedGreedySearchSSP(sizes = sizes, capacity = capacity, tikz = TRUE)
##' IsFeasible(solution, sizes, capacity)
##' @export
IteratedGreedySearchSSP <- function(sizes, capacity = sum(sizes) %/% 2, iterations = length(sizes), tikz = FALSE) {
    solution <- GreedySearchSSP(sizes, capacity)
    if(tikz) ExportTikz(solution, sizes, capacity, picY = 0)
    iterations <- max(1, min(length(sizes), iterations))
    if(iterations > 1 && !IsFeasible(solution, sizes, capacity)) {
        for(i in seq(1, iterations - 1)) {
            restrictedSizes <- tail(sizes, -i)
            restrictedSolution <- GreedySearchSSP(restrictedSizes, capacity)
            solution <- c(rep(NA, i), restrictedSolution)
            if(tikz) ExportTikz(solution, sizes, capacity, picY = -2 * i)
            if(IsFeasible(solution, sizes, capacity) ||
               isTRUE(restrictedSolution)) {
                return(solution)
            }
        }
    }
    return(solution)
}
