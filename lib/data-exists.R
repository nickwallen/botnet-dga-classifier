
#
# returns true if a data frame (or anything like a data frame) exists in the 
# current environment under a given name.  otherwise, returns false.
#
data_exists <- function (name.of.data) {
    exists (name.of.data) && is.data.frame ( get (name.of.data))
}