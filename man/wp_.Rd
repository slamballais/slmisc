% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import.R
\name{wp_}
\alias{wp_}
\title{Write to clipboard}
\usage{
wp_(x, sep = "\\t", row.names = F, quote = F, ...)
}
\arguments{
\item{x}{a matrix or data frame}

\item{sep}{the field separator character (see `?write.table`)}

\item{row.names}{see `?write.table`}

\item{quote}{see `?write.table`}

\item{...}{further arguments for `write.table`}
}
\description{
`wp_` is the inverse of `cp_`, allowing users to write matrices and data frames to the clipboard
}
