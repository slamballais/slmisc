context("Testing import functions")
library(slmisc)

f <- as.data.frame(matrix(1:100, 10))

check_cp <- function(){
  if (Sys.info()["sysname"] != "Windows"){
    skip("System is not Windows, so cp_ and wp_ won't work.")
  }
}

test_that("wp_ and cp_ properly work", {
  check_cp()
  expect_equal(f, cp_(wp_(f)))
})


