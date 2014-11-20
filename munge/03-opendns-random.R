#
# Per http://labs.opendns.com/2014/06/05/two-new-public-domain-lists-security-researchers/ ...
#
# The OpenDNS Random Sample List is a random sample of 10,000 domain names. Similar to the OpenDNS 
# Top Domains List, domains that we flagged as suspicious are not present in the list, that can be 
# used as a benign data set.
# 
# Both lists are in public domain, available on Github, and are automatically updated weekly.
# They are not meant to replace other public lists in any way. The Top Domains List, in particular, 
# is solely based on DNS queries and doesn’t reflect the popularity of websites.
#

url  <- "https://raw.githubusercontent.com/opendns/public-domain-lists/master/opendns-random-domains.txt"
path <- file.path (tempdir(), "opendns-random-domains.txt")

if (!data_exists ("opendns_random")) {
    
    # download the data, if needed
    if (!file.exists (path)) {
        download.file (url, path)
    }
    
    # uncompress and read the csv data
    opendns_random <- fread (path, header = FALSE)
    setnames (opendns_random, "host")
    
    # clean some of the fields
    opendns_random [, source := "opendns-random-10k"]
    opendns_random [, type   := "legit"]
}