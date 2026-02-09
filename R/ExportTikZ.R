##' Export the assignment to a TikZ drawing
##'
##' The function exports the partial or total assignment to a TikZ drawings with a \\pic macro.
##'
##' @inheritParams IsFeasible
##' @param picX The x-coordinate in the TikZ drawing
##' @param picY The y-coordinate in the TikZ drawing
##' @encoding UTF-8
##' @keywords internal
ExportTikZ <- function(solution, sizes, capacity, picX = 0, picY = 0) {
    solution[ is.na(solution)] <- 2
    cat(
        sprintf(
            "\\pic at (%d, %d) {subset sum = {capacity = %d, sizes = {%s}, deck = {%s}}};\n",
            picX, picY, capacity, paste(sizes, collapse = ","), paste(solution, collapse = ",")
        )
    )
    return(invisible(NULL))
}
