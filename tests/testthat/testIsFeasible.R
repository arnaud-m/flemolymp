library(testthat)
library(flemolymp)

test_that("Exact fit returns TRUE", {
    expect_true(IsFeasible(solution = c(TRUE, FALSE, TRUE), c(3, 5, 2), 5))
})

test_that("Over capacity returns FALSE", {
    expect_false(IsFeasible(solution = c(FALSE, TRUE, TRUE), c(3, 5, 2), 5))
})

test_that("Under capacity returns FALSE", {
    expect_false(IsFeasible(solution = c(FALSE, FALSE, TRUE), c(3, 5, 2), 5))
})

test_that("Handles empty knapsack", {
    expect_false(IsFeasible(solution = c(FALSE, FALSE, FALSE), c(3, 5, 2), 5))
})

test_that("Handles NA values in solution", {
    expect_true(IsFeasible(solution = c(TRUE, NA, TRUE), c(3, 5, 2), 5))
    expect_false(IsFeasible(solution = c(NA, TRUE, TRUE), c(3, 5, 2), 5))
})
