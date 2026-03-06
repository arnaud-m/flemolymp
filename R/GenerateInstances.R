##' Generate Subset Sum Problem Instances
##'
##' Generates a set of Subset Sum Problem (SSP) instances.
##' Each instance is created by randomly sampling a subset of items and computing summary statistics.
##'
##' @param n An integer indicating the number of instances to generate.
##' @param k An integer indicating the number of items in each instance.
##' @param items A numeric vector representing the sizes of the available items.
##'
##' @return  list with two elements:
##' \describe{
##'   \item{inputs}{The list of SSP instances, each is a numeric vector of item sizes.}
##'   \item{outputs}{A data frame of summary statistics for each instance.}
##' }
##' @examples
##' # Generate 5 instances with 8 items each from the default items pool
##' GenerateInstances(n = 5, k = 8, items)
##' @encoding UTF-8
##' @export
GenerateInstances <- function(n, k, items) {
    ## Internal function to generate a single instance
    GenerateItems <- function() sort(sample(x = items, size = k, replace = FALSE), decreasing = TRUE)
    ## Generate n instances with k items
    inputs <- replicate(n, GenerateItems(), simplify = FALSE)
    ## Compute summary statistics for all instances
    return(SummaryInstances(inputs));
}
