##' First Fit Greedy Search for the Subset Sum Problem
##'
##' This function applies the first fit greedy algorithm for the subset sum problem.
##'
##' @inheritParams IsFeasible
##' @return A single-row data frame with summary performance metrics for the GS, MTGS, and DP algorithms.
##' @encoding UTF-8
##' @examples
##' sizes <- c(16, 12, 10, 9, 6, 5, 3, 2, 1)
##' capacity <- sum(sizes) %/% 2
##' SummarySSP(sizes, capacity)
##'
##' sizes <- c(16, 15, 14, 13, 12, 9, 8, 6, 1)
##' capacity <- sum(sizes) %/% 2
##' SummarySSP(sizes, capacity)
##' @export
SummarySSP <-function(sizes, capacity) {
    solGS <- GreedySearchSSP(sizes, capacity)
    solMTGS <- IteratedGreedySearchSSP(sizes, capacity)
    tableDP <- DynamicProgrammingSSP(sizes, capacity)

    results <- data.frame(
        IN.n = length(sizes),
        IN.capa = capacity,
        GS.status = IsFeasible(solGS, sizes, capacity),
        GS.iterations = sum(is.na(solGS) | solGS),
        MTGS.status = IsFeasible(solMTGS, sizes, capacity),
        MTGS.iterations = head(which(solMTGS == TRUE), 1),
        DP.status = tail(tableDP, 1) > 0,
        DP.iterations = max(tail(tableDP, -1))
    )
    type <- ifelse(results$DP.status,
                 ifelse(results$MTGS.status,
                 ifelse(results$GS.status, 1, 2),
                 3),
                 4)
    return(cbind(results, type = type))
}
