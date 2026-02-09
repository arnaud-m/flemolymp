##' First Fit Greedy Search for the Subset Sum Problem
##'
##' This function applies the first fit greedy algorithm for the subset sum problem.
##'
##' @inheritParams IsFeasible
##' @param tikz A logical value that triggers TikZ export
##' @return A logical vector indicating which items are included in the knapsack.
##'   Each element should be \code{TRUE} if the corresponding item is taken, or \code{FALSE}/\code{NA} otherwise.
##' @encoding UTF-8
##' @examples
##' sizes <- c(16, 12, 10, 9, 6, 5, 3, 2, 1)
##' capacity <- sum(sizes) %/% 2
##' solution <- GreedySearchSSP( sizes = sizes, capacity = capacity)
##' IsFeasible(solution, sizes, capacity)
##'
##' sizes <- c(16, 15, 14, 13, 12, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' solution <- GreedySearchSSP(sizes = sizes, capacity = capacity, tikz = TRUE)
##' IsFeasible(solution, sizes, capacity)
##' @export
GreedySearchSSP <- function(sizes, capacity, tikz = FALSE) {
    solution <- logical(length(sizes))
    total <- 0
    for(i in seq_along(sizes)) {
        tot <- total + sizes[i]
        if(tot <= capacity) {
            total <- tot
            solution[i] <- TRUE
        } else {
            solution[i] <- NA
        }
        if(tikz) ExportTikZ(solution, sizes, capacity, picY = -2 * i)
        if(total == capacity) return(solution)
    }
    return(solution)
}
