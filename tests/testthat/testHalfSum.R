test_that("Even sum", {
  sizes <- c(3, 5, 2, 4)
  expect_equal(HalfSum(sizes), 7)
})

test_that("Odd Sum", {
  sizes <- c(3, 4, 6, 8)
  expect_equal(HalfSum(sizes), 10)
})

test_that("Half Sum with NAs", {
    sizes <- c(3, 4, 6, 8, NA)
    expect_true(is.na(HalfSum(sizes)))
})

test_that("Non-numeric Half Sum", {
  sizes <- c("a", "b", "c")
  expect_error(HalfSum(sizes))
})
