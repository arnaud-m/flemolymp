#' Partition Problem Instances
#'
#' A collection of item sets used to create instances of the Partition Problem
#' for educational purposes.
#'
#' Each element of the dataset is a numeric vector representing the sizes of
#' items in a single instance. The goal of the Partition Problem is to divide
#' the items into two subsets with equal total size.
#'
#' This problem is a special case of the Subset Sum Problem where the target
#' capacity is half of the total size of all items.
#'
#' @format A list of numeric vectors. Each element represents one Partition
#' Problem instance and contains the sizes of items.
#'
#' @details
#' For an instance with item sizes `x`, the corresponding subset sum capacity
#' is typically defined as:
#'
#' `sum(x) %/% 2`
#'
#' These instances are designed for educational activities exploring heuristic
#' and exact algorithms for the Subset Sum Problem.
#'
#' @source
#' Generated for the *Flemme Olympique* workshops at Terra Numerica.
#'
#' @seealso
#' [HalfSum()], [SummarySSP()], [SummaryInstances()], [GenerateInstances()]
"inputs"
