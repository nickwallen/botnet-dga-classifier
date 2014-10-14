#
# count the number of valid dictionary words that exist as substrings
# in each of the domains
#

# maintaining our own speller ensures that it is not created and
# destroyed for each domain.
s <- getSpeller ()

domains [, dictionary := count_dictionary_substrings (domain, speller = s) ]
         #, by = domain]
