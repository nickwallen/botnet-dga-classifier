#
# merges all of the domain data from the various sources into a data set
# that we can start to do some modeling with.
#

# stack the data from all sources
domains <- rbindlist (list (alexa, dds, opendns_random, opendns_top, quantcast))
rm (alexa, dds, opendns_random, opendns_top, quantcast)

# fix-up the data types
domains [, host := as.character (host)]
domains [, type := as.factor (type)]

# extract the tld and domain
domains [, domain := extract_domain (host) ]
domains [, tld    := extract_tld (host) ]

# exclude any domains that could not be parsed correctly
domains <- domains [ complete.cases (domains) ]

