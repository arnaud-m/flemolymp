test_that("Feasible Partition", {
     sizes <- c(16, 12, 10, 9, 6, 5, 3, 2, 1)
     capacity <- sum(sizes) %/% 2
     solution <- GreedySearchSSP( sizes = sizes, capacity = capacity)
     expect_true(IsFeasible(solution, sizes, capacity))
})

test_that("Infeasible Partition", {
    sizes <- c(16, 15, 14, 13, 12, 9, 8, 6, 1)
    capacity <- sum(sizes) %/% 2
    solution <- GreedySearchSSP(sizes = sizes, capacity = capacity)
    expect_false(IsFeasible(solution, sizes, capacity))

})
