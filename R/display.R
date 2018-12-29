#' Checks if all elements are NA
#'
#' @param x a vector
#' @return a logical

allNA <- function(x) all(is.na(x))

#' Checks if any elements are NA
#'
#' @param x a vector
#' @return a logical

anyNA <- function(x) any(is.na(x))

#' For a data frame, returns per column the proportion of missing values
#'
#' @param x a data frame
#' @return a vector of proportions

cMiss <- function(x) sapply(x,function(x) length(which(is.na(x)))/length(x))

#' For a data frame, returns per column the number of unique values
#'
#' @param x a data frame
#' @return a vector of proportions

cUnique <- function(x) sapply(x,function(x) sum(!is.na(unique(x))))

#' Array-based version of `head` (default = 6)
#'
#' @param x an array (vector, matrix, etc.) or data frame
#' @param ... a scalar or vector. If scalar, all dimensions will have the same number of elements. If vector, it should match the length of the number of dimensions.
headn <- function(x, ...) {
  y <- unlist(list(...))
  if (is.null(y)) y <- 6
  d <- dim(x)
  if (is.null(d)) d <- length(x)
  h <- rep(NA, length(d))
  if (length(y) == 1) {
    h[] <- y
  } else if (length(y) == length(d)) {
    h <- y
  } else {
    stop("you provided an incorrect number of dimensions")
  }
  do.call(`[`, c(list(x), lapply(h, seq_len), drop = FALSE))
}


#' Wrapper for summary(lm(...))
#' @param ... further arguments for `lm`
#' @importFrom stats lm

lms <- function(...) summary(stats::lm(...))

#' Wrapper for length(which(...))
#'
#' @param ... further arguments for `which`

lw <- function(...) length(which(...))

#' Finds the modes (modi) central tendency
#'
#' @param x a vector/factor for which to find the mode
#' @param out an integer that defines the maximum number of modi to display
#' @param warn a logical; if TRUE, a warning is displayed if more modi are found than `out`

Mode <- function(x, out = NULL, warn = TRUE) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  y <- ux[which(tab == max(tab))]
  if(!is.null(out) && length(y) > out){
    if (warn) warning("Found ", length(y)," values, returning only ", out, " value", ifelse(out != 1,"s",""))
    y <- y[seq_len(out)]
  }
  y
}

#' Wrapper for table(..., useNA = "always")
#' 
#' @param ... Further arguments for `table`

tableNA <- function(...) table(..., useNA = "always")

#' For a data frame, returns per column the maximal proportion of values that are the same
#'
#' @param x a data frame
#' @return a vector of proportions

pMax <- function(x) unname(sapply(x, function(y) {tab <- table(y); max(tab) / sum(tab)}))

#' For a data frame, returns per row the proportion of missing values
#'
#' @param x a data frame
#' @return a vector of proportions

rMiss <- function(x) rowSums(is.na(x)) / ncol(x)

