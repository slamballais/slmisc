context("Testing convert functions")
library(slmisc)

f <- as.factor(10:1)

test_that("f2n properly converts", {
  expect_equal(length(f), length(f2n(f)))
  expect_equal(f2n(f), 10:1)
})