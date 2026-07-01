# Flemme Olympique - Interactive Operations Research Workshops for Terra Numerica

<!-- badges: start -->
[![License: MIT](<https://img.shields.io/badge/License-MIT-yellow.svg>)](LICENSE.md)
[![License: CC BY 4.0](<https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg>)](LICENSE_CONTENT.md)
<!-- badges: end -->


The goal of **flemolymp** is to provide a hands-on introduction to the **subset sum problem** in operations research.

Participants tackle computational challenges while creating **Olympic-style highlight videos**, combining **algorithmic thinking** with **creative storytelling**. This activity is designed for **Terra Numerica**, offering an engaging way to explore optimization concepts in a playful and interactive setting.

You can read the [French facilitator's manual](doc/manuel-flemolymp.pdf) for more information.

## Installation

You can install the development version of flemolymp from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("arnaud-m/flemolymp")
```

## Example

This is a basic example which shows you how to solve a subset sum problem with greedy search and dynamic programming:

``` r
library(flemolymp)
# Example input: list of integer vectors representing partition instances
inputs <- list(
  c(11, 8, 7, 5, 2, 1),
  c(14, 13, 11, 7, 5, 3)
)

# Compute summary statistics for the instances
x <- SummaryInstances(inputs)

# Inspect the summary statistics
print(x$outputs)

# Solve the first instance with the greedy algorithm
solutionGreedy <- GreedySearchSSP(
  sizes = inputs[[1]],
  capacity = HalfSum(inputs[[1]])
)

cat("Greedy solution for instance 1:\n")
print(solutionGreedy)
print(inputs[[1]][sapply(solutionGreedy, isTRUE)])

# Solve the second instance with dynamic programming
reachedDP <- DynamicProgrammingSSP(
  sizes = inputs[[2]],
  capacity = HalfSum(inputs[[2]])
)

cat("Dynamic programming solution for instance 2:\n")
solutionDP <- GetSolutionDP(reachedDP, inputs[[2]])
print(solutionDP)
print(inputs[[2]][sapply(solutionDP, isTRUE)])
```

# Licenses

- The R code is licensed under the **MIT License**. See `LICENSE.md` for details.
- Pedagogical content (images, text, diagrams) is licensed under **CC BY 4.0**. See `LICENSE_CONTENT.md` for details.

Copyright 2026 Université Côte d'Azur. All rights reserved.
