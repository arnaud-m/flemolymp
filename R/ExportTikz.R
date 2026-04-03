##' Export the assignment to a TikZ picture
##'
##' The function exports the partial or total assignment to a TikZ picture with a \\pic macro.
##'
##' @inheritParams IsFeasible
##' @param picX The x-coordinate in the TikZ drawing
##' @param picY The y-coordinate in the TikZ drawing
##' @encoding UTF-8
##' @keywords internal
ExportTikz <- function(solution, sizes, capacity, picX = 0, picY = 0, offset = 0) {
    solution[ is.na(solution)] <- 2
    cat(
        sprintf(
            "\\pic at (%d, %d) {subset sum = {capacity = %d, sizes = {%s}, deck = {%s}, offset = %d}};\n",
            picX, picY, capacity, paste(sizes, collapse = ","), paste(solution, collapse = ","), offset
        )
    )
    return(invisible(NULL))
}
