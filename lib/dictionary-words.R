#
# finds the fraction of all substrings that are valid dictionary words for
# a given string.  any additional arguments are passed through to the spell
# checker; aspell.
#
dictionary_words <- function (input, min_length = 2, ...) {
    
    # a single word is expected as input (not mulitple)
    stopifnot (length (input) == 1)
    
    # extract all of the substrings for the given word
    words <- unlist (sapply (1:nchar(input), function (start) {
        sapply (start:nchar (input), function (end) {
            substr (input, start, end)
        })
    }))
    
    # exclude any words that are too short
    words <- words [nchar (words) > min_length]
    
    # return the fraction of all substrings that are in the dictionary
    if (length (words) > 0)
        sum (aspell (words, ...)) / length (words)
    else
        0.0
}
