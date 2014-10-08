#
# loads a collection of 5,000 domains that were generated via a DGA from either the
# Cryptolocker, Goz, or Newgoz Botnets.  This collection was obtains from the guys
# at the Domain Driven Security blog.  More DGA domain data is necessary.
#

# rename the data table
dds <- dds.malicious.domains 
rm (dds.malicious.domains)

# add some additional fields
dds [, type := "malicious"]
