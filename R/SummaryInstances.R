##' Summarize a list of Subset Sum Problem instances
##'
##' Computes summary statistics for a list of Subset Sum Problem (SSP) instances.
##' Each instance is a numeric vector of item sizes. The function applies the
##' algorithms GS, MTGS, and DP via \code{SummarySSP} and returns a summary table
##' for all instances.
##'
##' @param inputs A non-empty list of numeric vectors. Each element represents a single SSP instance.
##' @param capacities Optional numeric vector. Capacity for each instance. If
##'   `NULL` (default), \code{HalfSum} is applied to each instance.
##'   If a single numeric value is provided, it is recycled for all instances.
##' @param sort Logical; whether to sort the output according to a predefined order (default TRUE).
##'
##' @return A list with two elements:
##' \describe{
##'   \item{inputs}{The list of SSP instances, possibly reordered.}
##'   \item{outputs}{A data frame of summary statistics for each instance.}
##' }
##' @examples
##' inputs <- list(c(14, 13, 11, 7, 5, 3), c(11, 8, 7, 5, 2, 1))
##' SummaryInstances(inputs)
##'
##' SummaryInstances(inputs, capacities = c(16, 25), sort = FALSE)
##' @encoding UTF-8
##' @export
SummaryInstances <- function(inputs, capacities = NULL, sort = TRUE) {
    ## Check inputs
    stopifnot(is.list(inputs), length(inputs) > 0)

    ## Check and update capacities
    if (is.null(capacities)) {
        capacities <- sapply(inputs, HalfSum)
    } else if (length(capacities) == 1) {
        capacities <- rep(capacities, length(inputs))
    } else {
        stopifnot(length(capacities) == length(inputs))
    }

    ## Compute summary for each instance
    outputs <- lapply(seq_along(inputs), function(i) {
        SummarySSP(inputs[[i]], capacities[i])
    })
    outputs <- do.call(rbind, outputs)

    ## Check for invariants
    stopifnot(
        all(outputs$DP.status | !outputs$GS.status),
        all(outputs$DP.status | !outputs$MTGS.status),
        all(outputs$MTGS.status | !outputs$GS.status),
        all(outputs$DP.status == (outputs$DP.solutions > 0))
    )

    ## Optional sorting
    stopifnot("type" %in% names(outputs))
    if (sort) {
        ind <-   ind <- order(outputs$type, outputs$DP.solutions, -outputs$MTGS.iterations, -outputs$GS.iterations, -outputs$DP.iterations)
        inputs <- inputs[ind]
        outputs <- outputs[ind, , drop = FALSE]
    }

    return(list(inputs = inputs, outputs = outputs))
}
