##' Export the dynamic programming table to a TikZ picture
##'
##' The function exports the dynamic programming table to a TikZ picture with a macro \\pic. The
##'
##' @inheritParams ExportTikz
##' @param reached A numeric vector from dynamic programming, where element `i`
##'   is positive if there exists a combination of items whose total size is `i`.
##'   A positive value indicates that the combination includes the corresponding item.
##' @encoding UTF-8
##' @keywords internal
ExportTikzDP <- function(reached, sizes, capacity, picX = 0, picY = 0) {
    ind <- tail(which(reached > 0), -1)
    solution <- rep(0, length(sizes))
    solution[unique(reached[ind]) ] <- 1
    cat(
        sprintf(
            "\\pic at (%d, %d) {prog dyn = {capacity = %d, sizes = {%s}, deck = {%s}, marks = {%s}}};\n",
            picX, picY, capacity, paste(sizes, collapse = ","), paste(solution, collapse = ","), paste( ind - 1, reached[ind], sep = "/", collapse = ", ")
        )
    )
}
