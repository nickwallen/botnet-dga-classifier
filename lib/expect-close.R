#
# expects that two values are within a defined tolerance.  this is a function
# that is sorely needed in the 'testthat' package.
#
expect_close <- function (object, expected, delta = 0.05, ...) {
    expect_true (abs (object - expected) <= delta)
}
