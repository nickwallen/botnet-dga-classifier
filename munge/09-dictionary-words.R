#
# for each domain, tallies the fraction of all substrings that are valid 
# dictionary words.  malicious domains tend to have fewer dictionary words.
#

# maintaining a single speller ensures that it is not created/destroyed for each domain
s <- getSpeller ()

domains [, 
         dictionary := dictionary_words (domain, speller = s), 
         by = domain]
