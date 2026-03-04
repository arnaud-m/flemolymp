test_that("Feasible Partition 1", {
     sizes <- c(16, 12, 10, 9, 6, 5, 3, 2, 1)
     capacity <- sum(sizes) %/% 2
     expect_equal(DynamicProgrammingEnumSSP(sizes = sizes, capacity = capacity), 14)
})

test_that("Feasible Partition 2", {
    sizes <-  c(16, 15, 14, 13, 12, 9, 8, 6, 1)
    capacity <- sum(sizes) %/% 2
    expect_equal(DynamicProgrammingEnumSSP(sizes = sizes, capacity = capacity), 8)
})

test_that("Feasible Partition 3", {
    sizes <- c(16, 15, 14, 10, 9, 8, 6, 5, 3)
    capacity <- sum(sizes) %/% 2
    expect_equal(DynamicProgrammingEnumSSP(sizes = sizes, capacity = capacity), 12)
})

test_that("Infeasible Partition 1", {
    sizes <-  c(15, 14, 9, 8, 6, 1)
    capacity <- sum(sizes) %/% 2
    expect_equal(DynamicProgrammingEnumSSP(sizes = sizes, capacity = capacity), 0)
})

test_that("Infeasible Feasible Partition 2", {
    sizes <- c(18, 17, 16, 15, 14, 5, 2, 1)
    capacity <- sum(sizes) %/% 2
    expect_equal(DynamicProgrammingEnumSSP(sizes = sizes, capacity = capacity), 0)
})
