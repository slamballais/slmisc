#' Copy-paste tables from clipboard
#'
#' `cp_` allows you to import items from the clipboard (Ctrl + C or Ctrl + X on Windows) to `R`. This works for Microsoft Excel, Microsoft Word, most websites, etc. It's a wrapper for `read.delim` with input `clipboard`.
#' @param sep the field separator character. Values on each line of the file are separated by this character. If sep = "" (the default for read.table) the separator is ‘white space’, that is one or more spaces, tabs, newlines or carriage returns.
#' @param ... further arguments for `read.delim`

cp_ <- function(sep="", ...) do.call(read.delim, c("clipboard",sep=sep,list(...)))