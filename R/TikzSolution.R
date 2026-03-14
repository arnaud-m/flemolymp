#' Generate a TikZ figure for a Subset Sum Problem solution
#'
#' Produce LaTeX/TikZ code representing the solution of a Subset Sum Problem
#' (SSP) instance using a specified algorithm. The resulting code is wrapped
#' in a LaTeX `figure` environment and can be inserted directly into a LaTeX
#' document.
#'
##' @inheritParams IsFeasible
#' @param algorithm Character string specifying the algorithm used to solve the
#'   instance. Supported values are `"GS"` (Greedy Search), `"MTGS"`
#'   (Iterated Greedy Search), and `"DP"` (Dynamic Programming).
#' @param caption Optional character string used as the figure caption.
#' @param label Optional character string used as the figure label.
#'
#' @return A character string containing the LaTeX code of the TikZ figure.
#'
#' @examples
#' sizes <- c(14, 13, 11, 7, 5, 3)
#' capacity <- 26
#'
#' cat(TikzSolution(sizes, capacity, algorithm = "GS"))
#' cat(TikzSolution(sizes, capacity, algorithm = "DP",
#'              caption = "Dynamic programming solution",
#'              label = "fig:dp"))
#'
#' @encoding UTF-8
#' @export
TikzSolution <- function(sizes, capacity, algorithm, caption = NULL,  label = NULL) {

  ## Argument checks
  stopifnot(
    is.numeric(sizes),
    length(sizes) > 0,
    is.numeric(capacity),
    length(capacity) == 1,
    is.character(algorithm),
    length(algorithm) == 1
  )

  ## Supported algorithms
  valid_algorithms <- c("GS", "MTGS", "DP")
  if (!(algorithm %in% valid_algorithms)) {

  }

  ## Collect LaTeX output
  out <- character()

  out <- c(out, "\\begin{figure}[htbp]")
  out <- c(out, "\\centering")
  out <- c(out, "\\resizebox{0.9\\linewidth}{!}{")
  out <- c(out, "\\begin{tikzpicture}")

  ## Generate TikZ content depending on the algorithm
  if (algorithm == "GS") {
    out <- c(out,
             utils::capture.output(
               invisible(GreedySearchSSP(sizes, capacity, tikz = TRUE))
             ))
  } else if (algorithm == "MTGS") {
    out <- c(out,
             utils::capture.output(
               invisible(IteratedGreedySearchSSP(sizes, capacity, tikz = TRUE))
             ))
  } else if (algorithm == "DP") {
      out <- c(out,
               utils::capture.output(
                   ExportTikz(GetSolutionDP(DynamicProgrammingSSP(sizes, capacity, tikz = TRUE), sizes), sizes, capacity)
               ))
  } else {
      stop("Unknown algorithm: ", algorithm)
  }

  out <- c(out, "\\end{tikzpicture}")
  out <- c(out, "}")

  ## Optional caption
  if (is.character(caption) && length(caption) == 1) {
    out <- c(out, sprintf("\\caption{%s}", caption))
  }

  ## Optional label
  if (is.character(label) && length(label) == 1) {
    out <- c(out, sprintf("\\label{%s}", label))
  }

  out <- c(out, "\\end{figure}\n")

  ## Return LaTeX code
  paste(out, collapse = "\n")
}
