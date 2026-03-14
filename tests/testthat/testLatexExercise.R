test_that("LatexExercise generates valid LaTeX output", {
                                        # Example inputs
    inputs <- list(
        c(14, 13, 11, 7, 5, 3),
        c(11, 8, 7, 5, 2, 1)
    )
    x <- SummaryInstances(inputs)

    ## Generate LaTeX for first type using GS
    tex <- LatexExercise(x$inputs, x$outputs, algorithm = "GS", type = 1)

    ## The output should be a character vector of length 1
    expect_true(is.character(tex))
    expect_length(tex, 1)

    ## The vector should have a non-empty name
    expect_true(!is.null(names(tex)))
    expect_true(nzchar(names(tex)))

    ## remove name for matching
    tex <- unname(tex)

    ## Check for presence of key LaTeX environments
    expect_match(tex, "\\\\begin\\{exercice\\}", perl = TRUE)
    expect_match(tex, "\\\\begin\\{table\\}", perl = TRUE)
    expect_match(tex, "\\\\begin\\{tikzpicture\\}", perl = TRUE)
})

test_that("LatexExercise fails on unsupported arguments", {
                                        # Example inputs
    inputs <- list(
        c(14, 13, 11, 7, 5, 3),
        c(11, 8, 7, 5, 2, 1)
    )
    x <- SummaryInstances(inputs)

    expect_error(
        LatexExercise(x$inputs, x$outputs, algorithm = "UNKNOWN", type = 1),
        "Unknown algorithm"
    )

    expect_error(
        LatexExercise(x$inputs, x$outputs, algorithm = "GS", type = -1),
    )

    expect_error(
        LatexExercise(inputs = c(1,2,3), outputs = x$outputs, algorithm = "GS", type = 1)
    )

    expect_error(
        LatexExercise(inputs = x$inputs, outputs = list(a=1), algorithm = "GS", type = 1)
    )
})
