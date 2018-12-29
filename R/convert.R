#' Convert factor into numeric
#'
#' @param f a factor that contains values that can be converted with as.numeric

f2n <- function(f) as.numeric(levels(f))[f]