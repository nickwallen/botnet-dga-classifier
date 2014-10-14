#
# counts the number of substrings that are valid dictionary words for
# a given string.
#
count_dictionary_substrings <- function (input, min_length = 1, ...) {

    if (require (doMC)) library (doMC)
    
    # extract all of the substrings for the given input
    words <- unlist (
        foreach (start = 1:nchar(input)) %dopar% {
            foreach (end = start:nchar (input)) %dopar% {
                substr (input, start, end)
            }
        })
    
    # sum the number of dictionary words that are greater than the min length
    sum (aspell (words, ...) & nchar (words) > min_length)
}
