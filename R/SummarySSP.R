##' Summary statistics for solving the Subset Sum Problem
##'
##' This function applies multiple algorithms (GS, MTGS, DP) for solving the subset sum problem and reports performance statistics.
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
    solCount <- DynamicProgrammingEnumSSP(sizes, capacity)

    results <- data.frame(
        IN.n = length(sizes),
        IN.capa = capacity,
        IN.dups = sum(duplicated(sizes)),
        IN.even = sum(sizes) %% 2 == 0,
        GS.status = IsFeasible(solGS, sizes, capacity),
        GS.iterations = sum(is.na(solGS) | solGS),
        MTGS.status = IsFeasible(solMTGS, sizes, capacity),
        MTGS.iterations = head(which(solMTGS == TRUE), 1),
        DP.status = tail(tableDP, 1) > 0,
        DP.iterations = max(tail(tableDP, -1)),
        DP.solutions = solCount,
        DP.density = mean(tableDP > 0)
    )
    type <- ifelse(results$DP.status,
                 ifelse(results$MTGS.status,
                 ifelse(results$GS.status, 1, 2),
                 3),
                 4)
    return(cbind(results, type = type))
}
