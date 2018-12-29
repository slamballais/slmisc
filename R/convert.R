#' Convert factor into numeric

f2n <- function(f) as.numeric(levels(f))[f]