
#
# expects that two values are within a defined tolerance.
#
expect_close <- function (object, expected, delta = 0.05, ...) {
    expect_true (abs (object - expected) <= delta)
}

expect_close (count_dictionary_substrings ("facebook"), 0.19)
expect_close (count_dictionary_substrings ("washington"), 0.22)
expect_close (count_dictionary_substrings ("a"), 0)
expect_close (count_dictionary_substrings ("at"), 0)
expect_close (count_dictionary_substrings ("art"), 1)
expect_close (count_dictionary_substrings (""), 0)
expect_close (count_dictionary_substrings ("xyzxyzxyz"), 0)
