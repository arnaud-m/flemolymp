## This script generates the LaTeX assets used in the pedagogical material:
## - exercises
## - instances table
## - TikZ figures


## Load the package in development mode
devtools::load_all()

## Compute summary statistics for the Subset Sum Problem instances
x <- SummaryInstances(inputs)

## Algorithms used to generate exercises and solutions
algorithms <- c("GS", "MTGS", "DP")

## Helper function generating a LaTeX exercise file.
LatexExFile <- function(i, j) {
    tex <- LatexExercise(x$inputs, x$outputs, algorithms[i], i + j)
    cat(tex, file = names(tex))
}

## Generate exercises for each algorithm and two instance types
for(i in seq_along(algorithms)) {
    LatexExFile(i, 0)
    LatexExFile(i, 1)
}

## Generate a LaTeX table summarizing all instances
cat(TableInstances(x$inputs, x$outputs, typeCol = TRUE), file = "instances.tex")

## Helper function for the partition of integers from 1 to n.
LatexPartFile <- function(n) {
    cat(
        TikzSolution(
            seq(n, 1),
            HalfSum(seq(n, 1)),
            "GS",
            caption = paste("Partition des entiers de 1 à ", n, ".", sep = ""),
            label = paste0("fig:part", n)
        ),
        file = paste0("partition-", n, ".tex")
    )
}

## Generate example figures of the partition problem
LatexPartFile(15)
LatexPartFile(16)
