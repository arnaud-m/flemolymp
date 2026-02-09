test_that("Feasible Partition GS", {
     sizes <- c(16, 12, 10, 9, 6, 5, 3, 2, 1)
     capacity <- sum(sizes) %/% 2
     solution <- IteratedGreedySearchSSP( sizes = sizes, capacity = capacity)
     expect_true(IsFeasible(solution, sizes, capacity))
})

test_that("Feasible Partition MTGS", {
    sizes <- c(16, 12, 10, 9, 6, 5, 3, 2, 1)
    capacity <- sum(sizes) %/% 2
    solution <- IteratedGreedySearchSSP( sizes = sizes, capacity = capacity)
    expect_true(IsFeasible(solution, sizes, capacity))
})

test_that("Infeasible Partition MTGS", {
    sizes <- c(16, 15, 14, 10, 9, 8, 6, 5, 3)
    capacity <- sum(sizes) %/% 2
    solution <- GreedySearchSSP(sizes = sizes, capacity = capacity)
    expect_false(IsFeasible(solution, sizes, capacity))
})
