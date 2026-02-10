#' Compute capacity for the partition problem
#'
#' Calculates the capacity for transforming the partition problem into a subset sum problem.
#' This is simply half of the total sum of the items.
#'
#' @param sizes ##' @param sizes A numeric vector representing the sizes (or weights) of each item (without NAs).
#' @return An integer giving the capacity of the knaspack (half of the total sum of items).
#' @details
#' If the sum of `sizes` is odd, integer division (`%/%`) is used, which rounds down.
#'
#' @examples
#' sizes <- c(3, 5, 2, 4)
#' HalfSum(sizes)
#'
#' sizes2 <- c(1, 2, 3, 5)
#' HalfSum(sizes2)
#'
#' @export
HalfSum <- function(sizes) {
    return(sum(sizes) %/% 2)
}
