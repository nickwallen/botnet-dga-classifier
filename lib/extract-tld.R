
#
# extracts the top-level domain (TLD) of a host URL.  for example,
# "www.amazon.com/path/foo" would result in "com"
#
extract_tld <- function (host) extract_domain (host, domain_position = 1)