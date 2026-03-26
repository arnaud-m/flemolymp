##' Generate a LaTeX exercise for a Subset Sum Problem instance
##'
##' This function generates the LaTeX code for an exercise, including a table
##' of the instance and TikZ figures of the solution(s)  produced by a
##' specified algorithm.
##'
##' @inheritParams TableInstances
##' @param algorithm Character string specifying the algorithm used to solve the
##'   instances. Supported values typically include ``GS"`, `"MTGS"`, `"DP"`
##' @param type Numeric value specifying the instance type used in the exercise.
##'
##' @return A character vector of length 1 containing the LaTeX code.
##'         The vector is **named**: the name corresponds to the suggested filename.
##'         This allows easy writing with `cat(tex, file = names(tex))`.
##'
##' @examples
##' inputs <- list(c(14, 13, 11, 7, 5, 3), c(11, 8, 7, 5, 2, 1))
##' x <- SummaryInstances(inputs)
##'
##' tex <- LatexExercise(x$inputs, x$outputs, algorithm = "GS", type = 1)
##'
##' names(tex)
##' cat(tex)
##'
##' @encoding UTF-8
##' @export
LatexExercise <- function(inputs, outputs, algorithm, type) {
    stopifnot(
        is.list(inputs),
        length(inputs) > 0,
        is.data.frame(outputs),
        length(inputs) == nrow(outputs),
        is.character(algorithm),
        length(algorithm) == 1,
        is.numeric(type),
        length(type) == 1
    )

    ## Select instances of the requested type
    ind <- which(outputs$type == type)
    if (length(ind) == 0) {
        stop("No instance found for type ", type)
    }


    ## Algorithm titles (for exercise titles)
    algotitles <- c(GS = "Algorithme glouton",
                  MTGS = "Algorithme glouton r\u00E9p\u00E9t\u00E9",
                  DP = "Programmation dynamique")

    ## Algorithm names (for captions)
    algonames <- paste0(c("l'", "l'", "la "), tolower(algotitles))

    ## Shared label postfix
    label <- sprintf("%s%d", algorithm, type)


    tex <- character()

    ## Exercise
    tex <- c(tex, sprintf("\\begin{exercice}[label=ex:%s]{%s (type %d)}{TODO Temps}\n", label, algotitles[algorithm], type))
    ## Instances table
    tex <- c(tex,
             TableInstances(inputs, outputs, ind,
                            caption = sprintf("Appliquer %s sur une instance de type %d.", algonames[algorithm], type),
                            label = paste0("tab:", label),
                            typeCol = FALSE))
    tex <- c(tex, "\\end{exercice}")

    ## Generate TikZ solutions
    for(i in seq_along(ind)) {
        tex <- c(tex,
                 TikzSolution(inputs[[ind[i]]], HalfSum(inputs[[ind[i]]]), algorithm,
                              caption = sprintf("Application de %s sur l'instance \\#%d.", algonames[algorithm], ind[i]),
                              label = paste0("fig:", label, "-", ind[i])))
        if(i == 1) {
            tex <- c(tex, "\n\\ifshowsols")
        }
    }
    ## Show solutions conditionally in LaTeX
    tex <- c(tex, "\\fi\n")


    ## Combine lines into a single string
    tex <- paste(tex, collapse = "\n")
    filename <- sprintf("ex%d-%s.tex", type, algorithm)
    names(tex) <- filename
    return(tex)
}
