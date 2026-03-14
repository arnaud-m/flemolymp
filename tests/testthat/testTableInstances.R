test_that("TableInstances generates valid LaTeX output", {

    inputs <- list(
        c(14, 13, 11, 7, 5, 3),
        c(11, 8, 7, 5, 2, 1)
    )

    x <- SummaryInstances(inputs)

    tex <- TableInstances(x$inputs, x$outputs)

    expect_type(tex, "character")
    expect_true(nchar(tex) > 0)

    ## Check that important LaTeX structure is present
    expect_match(tex, "\\begin{table}", fixed = TRUE)
    expect_match(tex, "\\begin{tabular}", fixed = TRUE)
    expect_no_match(tex, "Type", fixed = TRUE)
    expect_match(tex, "\\end{tabular}", fixed = TRUE)
    expect_no_match(tex, "\\caption", fixed = TRUE)
    expect_no_match(tex, "\\label", fixed = TRUE)
    expect_match(tex, "\\end{table}", fixed = TRUE)
})


test_that("TableInstances generates valid LaTeX output", {

    inputs <- list(
        c(14, 13, 11, 7, 5, 3),
        c(11, 8, 7, 5, 2, 1)
    )

    x <- SummaryInstances(inputs)

    tex <- TableInstances(x$inputs, x$outputs, ind = 1, caption = "caption", label = "label", typeCol = TRUE)

    expect_type(tex, "character")
    expect_true(nchar(tex) > 0)

    ## Check that important LaTeX structure is present
    expect_match(tex, "\\begin{table}", fixed = TRUE)
    expect_match(tex, "\\begin{tabular}", fixed = TRUE)
    expect_match(tex, "Type", fixed = TRUE)
    expect_match(tex, "\\end{tabular}", fixed = TRUE)
    expect_match(tex, "\\caption", fixed = TRUE)
    expect_match(tex, "\\label", fixed = TRUE)
    expect_match(tex, "\\end{table}", fixed = TRUE)
})




test_that("TableInstances handles invalid inputs", {

    expect_error(
        TableInstances(1:5, data.frame())
    )

    expect_error(
        TableInstances(list(), data.frame())
    )
})
