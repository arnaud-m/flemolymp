#' Check if a knapsack solution is feasible
#'
#' This function evaluates whether a given selection of items exactly fills the knapsack.
#'
#' **Warning:** This is an *unsafe* version of the function without input checking for performance reasons.
#'
#' @param solution A logical vector indicating which items are included in the knapsack.
#'   Each element should be \code{TRUE} if the corresponding item is taken, or \code{FALSE}/\code{NA} otherwise.
#' @param sizes A numeric vector representing the sizes (or weights) of each item (without NAs).
#' @param capacity A single numeric value giving the total capacity of the knapsack.
#'
#' @return \code{TRUE} if the selected items exactly fill the knapsack; \code{FALSE} otherwise.
#'
#' @examples
#' IsFeasible(solution = c(TRUE, FALSE, TRUE), sizes = c(3, 5, 2), 5)
#'
#' IsFeasible(solution = c(TRUE, FALSE, TRUE), sizes = c(1, 5, 2), 5)
#' @encoding UTF-8
#' @export
IsFeasible <- function(solution, sizes, capacity) {
    return(sum(sizes[solution], na.rm = TRUE) == capacity)
}
