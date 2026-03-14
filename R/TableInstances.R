##' Generate a LaTeX table of Subset Sum Problem instances
##'
##' Create a LaTeX table summarizing a set of Subset Sum Problem (SSP) instances.
##' Each instance is described by its identifier, size, list of integers, and
##' capacity. Optionally, the instance type can also be displayed.
##'
##' @param inputs A non-empty list of numeric vectors. Each element represents a single SSP instance.
##' @param outputs A data frame containing summary statistics for each instance.
##' @param ind Integer indices of the instances to include. Defaults to all.
##' @param caption Optional caption passed to `xtable`.
##' @param label Optional label passed to `xtable`.
##' @param typeCol Logical. If `TRUE`, a column displaying the instance type is
##'   added to the table.
##'
##' @return A character string containing the LaTeX code of the table.
##'
##' @examples
##' inputs <- list(c(14, 13, 11, 7, 5, 3), c(11, 8, 7, 5, 2, 1))
##' x <- SummaryInstances(inputs)
##'
##' cat(TableInstances(x$inputs, x$outputs))
##'
##' cat(TableInstances(x$inputs, x$outputs, typeCol = TRUE))
##' @encoding UTF-8
##' @export
TableInstances <- function(inputs, outputs, ind = seq_along(inputs), caption = NULL, label = NULL, typeCol = FALSE) {
    ## Check arguments
    stopifnot(
        is.list(inputs),  length(inputs) > 0,
        is.data.frame(outputs), length(inputs) == nrow(outputs),
        is.numeric(ind), all(ind %in% seq_along(inputs)),
        is.logical(typeCol))

    ## Build data frame
    df <- data.frame(
        "Id" = ind,
        "Taille" = outputs$IN.n[ind],
        "Entiers" = sapply(inputs[ind], paste, collapse = ", "),
        "Capacit\u00E9" = as.integer(outputs$IN.capa[ind])
    )

    ## Column alignment
    align <- c("c", "c", "c", "l", "c")

    ## Optional type column
    if(typeCol) {
        df <- cbind(df, "Type" = outputs$type[ind])
        align <- append(align, "c")
    }

    ## Check xtable availability
    if (!requireNamespace("xtable", quietly = TRUE)) {
        stop("Package 'xtable' is required for LaTeX export, please install it.")
    }

    ## Create xtable
    tab <- xtable::xtable(df,
                          align = align,
                          caption = caption,
                          label = label)

    ## Return LaTeX table
    latex <- print(tab,
                   table.placement = "H",
                   include.rownames = FALSE,
                   booktabs = TRUE,
                   sanitize.text.function = identity,
                   comment = FALSE,
                   print.results = FALSE)

    return(latex)
}
