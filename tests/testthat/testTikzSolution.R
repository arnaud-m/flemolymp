library(testthat)

test_that("TikzSolution generates valid TikZ figure with GS", {

  sizes <- c(14, 13, 11, 7, 5, 3)
  capacity <- HalfSum(sizes)

  tex <- TikzSolution(
    sizes,
    capacity,
    algorithm = "GS"
  )

  expect_type(tex, "character")
  expect_true(nchar(tex) > 0)

  ## Check important LaTeX/TikZ structure
  expect_match(tex, "\\begin{figure}", fixed = TRUE)
  expect_match(tex, "\\begin{tikzpicture}", fixed = TRUE)
  expect_match(tex, "\\end{tikzpicture}", fixed = TRUE)
  expect_match(tex, "\\end{figure}", fixed = TRUE)

})


test_that("TikzSolution handles caption and label wqith MTGS", {

  sizes <- c(14, 13, 11, 7, 5, 3)
  capacity <- HalfSum(sizes)

  tex <- TikzSolution(
    sizes,
    capacity,
    algorithm = "MTGS",
    caption = "Example caption",
    label = "fig:test"
  )

  expect_type(tex, "character")
  expect_true(nchar(tex) > 0)

  ## Check important LaTeX/TikZ structure
  expect_match(tex, "\\begin{figure}", fixed = TRUE)
  expect_match(tex, "\\begin{tikzpicture}", fixed = TRUE)
  expect_match(tex, "\\end{tikzpicture}", fixed = TRUE)
  expect_match(tex, "\\end{figure}", fixed = TRUE)

  expect_match(tex, "\\caption{Example caption}", fixed = TRUE)
  expect_match(tex, "\\label{fig:test}", fixed = TRUE)

})


test_that("TikzSolution generates valid TikZ figure with DP", {

    sizes <- c(14, 13, 11, 7, 5, 3)
    capacity <- HalfSum(sizes)

    tex <- TikzSolution(
        sizes,
        capacity,
        algorithm = "DP"
    )

    expect_type(tex, "character")
    expect_true(nchar(tex) > 0)

    ## Check important LaTeX/TikZ structure
    expect_match(tex, "\\begin{figure}", fixed = TRUE)
    expect_match(tex, "\\begin{tikzpicture}", fixed = TRUE)
    expect_match(tex, "\\end{tikzpicture}", fixed = TRUE)
    expect_match(tex, "\\end{figure}", fixed = TRUE)

})


test_that("TikzSolution validates arguments", {

    sizes <- c(14, 13, 11, 7, 5, 3)
    capacity <- HalfSum(sizes)

   expect_error(
       TikzSolution(sizes, capacity, "UNKNOWN")
   )

  expect_error(
    TikzSolution(NULL, capacity, "GS")
  )

  expect_error(
    TikzSolution(sizes, NULL, "GS")
  )

})
