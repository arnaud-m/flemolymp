inputs <-
    ## New instances
    list(
## Pour chaque n et chaque type, la première moitié des sacs est paire, alors que la seconde est impaire.
## n = 6
## Type 1
## c(23L, 20L, 18L, 13L, 9L, 1L),
c(25L, 22L, 14L, 12L, 9L, 4L),
c(25L, 20L, 18L, 11L, 4L, 2L),
## c(25L, 21L, 20L, 10L, 7L, 1L),
## Type 2
c(23L, 20L, 18L, 17L, 12L, 10L),
## c(25L, 24L, 17L, 14L, 12L, 5L),
## c(25L, 20L, 18L, 12L, 10L, 4L),
c(22L, 20L, 15L, 14L, 9L, 3L),
## Type 3
c(23L, 20L, 17L, 13L, 12L, 5L),
## c(25L, 21L, 20L, 16L, 10L, 2L),
c(25L, 20L, 17L, 14L, 11L, 8L),
## c(24L, 20L, 15L, 13L, 7L, 4L),
## Type 4
## c(25L, 22L, 20L, 17L, 5L, 3L),
c(24L, 21L, 19L, 15L, 9L, 4L),
c(25L, 22L, 15L, 13L, 9L, 1L),
## c(22L, 19L, 16L, 12L, 10L, 6L),
## n = 9
## Type 1
## c(23L, 19L, 14L, 13L, 9L, 8L, 5L, 4L, 1L),
c(21L, 17L, 15L, 13L, 9L, 6L, 5L, 4L, 2L),
## c(25L, 20L, 19L, 11L, 8L, 6L, 5L, 3L, 1L),
c(24L, 18L, 15L, 14L, 13L, 7L, 6L, 2L, 1L),
## Type 2
c(22L, 20L, 17L, 13L, 9L, 6L, 5L, 4L, 2L),
## c(25L, 19L, 17L, 13L, 8L, 7L, 5L, 4L, 2L),
## c(24L, 20L, 17L, 11L, 9L, 8L, 7L, 4L, 1L),
c(24L, 20L, 15L, 10L, 8L, 7L, 6L, 4L, 1L),
## Type 3
c(22L, 19L, 15L, 14L, 12L, 10L, 4L, 3L, 1L),
c(25L, 19L, 13L, 12L, 10L, 8L, 7L, 3L, 1L),
## c(25L, 19L, 13L, 12L, 10L, 8L, 7L, 3L, 1L),
## c(21L, 18L, 15L, 12L, 9L, 8L, 7L, 6L, 3L),
## Type 4
c(25L, 23L, 18L, 15L, 13L, 10L, 8L, 5L, 3L),
## c(24L, 18L, 16L, 14L, 10L, 8L, 6L, 4L, 2L),
c(25L, 24L, 15L, 14L, 13L, 12L, 11L, 2L, 1L),
## c(25L, 23L, 22L, 20L, 19L, 4L, 3L, 2L, 1L),
## n = 10
## Type 4
c(24L, 22L, 20L, 18L, 16L, 14L, 12L, 10L, 6L, 4L),
## c(24L, 22L, 20L, 18L, 16L, 14L, 8L, 6L, 4L, 2L),
## c(24L, 20L, 18L, 16L, 14L, 12L, 10L, 6L, 4L, 2L),
## c(25L, 24L, 23L, 22L, 21L, 20L, 19L, 5L, 2L, 1L),
## n = 11
## Type 4
c(24L, 22L, 20L, 18L, 16L, 14L, 12L, 10L, 8L, 6L, 4L),
## c(24L, 22L, 20L, 16L, 14L, 12L, 10L, 8L, 6L, 4L, 2L),
## n = 12
## Type 1
## c(24L, 20L, 19L, 17L, 16L, 15L, 10L, 9L, 8L, 7L, 2L, 1L),
c(25L, 23L, 22L, 20L, 13L, 11L, 9L, 7L, 6L, 5L, 3L, 2L),
## Type 2
## c(25L, 23L, 21L, 19L, 14L, 13L, 10L, 8L, 6L, 4L, 3L, 2L),
c(25L, 23L, 18L, 16L, 15L, 12L, 11L, 9L, 7L, 6L, 4L, 3L),
## Type 3
c(20L, 17L, 16L, 14L, 13L, 12L, 11L, 10L, 9L, 6L, 5L, 3L),
## c(21L, 20L, 18L, 17L, 14L, 13L, 11L, 10L, 8L, 7L, 6L, 4L),
## Type 4
## Not found
## n = 15
## Type 1
c(25L, 23L, 22L, 20L, 19L, 18L, 16L, 15L, 12L, 11L, 8L, 5L, 3L, 2L, 1L),
## c(25L, 24L, 23L, 22L, 21L, 16L, 14L, 13L, 11L, 10L, 7L, 6L, 4L, 3L, 2L),
## Type 2
c(25L, 23L, 21L, 19L, 18L, 17L, 15L, 14L, 13L, 10L, 7L, 6L, 5L, 4L, 3L),
## c(24L, 22L, 20L, 18L, 17L, 16L, 15L, 14L, 13L, 9L, 7L, 5L, 4L, 3L, 2L),
## Type 3
c(25L, 22L, 20L, 19L, 18L, 15L, 14L, 13L, 11L, 10L, 9L, 7L, 6L, 5L, 2L)
## c(24L, 22L, 21L, 19L, 17L, 15L, 14L, 13L, 12L, 11L, 8L, 6L, 4L, 3L, 2L)
## Type 4
## Not found
)
usethis::use_data(inputs, overwrite = TRUE)
