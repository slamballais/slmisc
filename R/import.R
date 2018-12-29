#' Copy-paste tables from clipboard
#'
#' `cp_` allows you to import items from the clipboard (Ctrl + C or Ctrl + X on Windows) to `R`. This works for Microsoft Excel, Microsoft Word, most websites, etc. It's a wrapper for `read.delim` with input `clipboard`.
#'
#' @param sep the field separator character. Values on each line of the file are separated by this character. If sep = "" (the default for `read.table`) the separator is white space, that is one or more spaces, tabs, newlines or carriage returns.
#' @param ... further arguments for `read.delim`
#' @importFrom utils read.delim

cp_ <- function(sep="", ...) {
  s <- Sys.info()["sysname"]
  if (s != "Windows") stop("cp_ only works for Windows.")
  do.call(utils::read.delim, c("clipboard",sep=sep,list(...)))
}

#' Write to clipboard
#'
#' `wp_` is the inverse of `cp_`, allowing users to write matrices and data frames to the clipboard
#' @param x a matrix or data frame
#' @param sep the field separator character (see `?write.table`)
#' @param row.names see `?write.table`
#' @param quote see `?write.table`
#' @param ... further arguments for `write.table`
#' @importFrom utils write.table

wp_ <- function(x, sep = "\t", row.names = F, quote = F, ...) {
  s <- Sys.info()["sysname"]
  if (s != "Windows") stop("cp_ only works for Windows.")
  utils::write.table(x, "clipboard", sep = sep, row.names = row.names, quote = quote, ...)
}