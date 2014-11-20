#
# Per http://labs.opendns.com/2014/06/05/two-new-public-domain-lists-security-researchers/ ...
#
# The OpenDNS Top Domains List is the top 10,000 domain names our resolvers all over the globe 
# are receiving queries for, sorted by popularity. The popularity is defined as the number of 
# unique client IPs having looked up a domain over a 1 hour period. Domain names that we flagged 
# as being used to serve or control malware are removed from the list.
# 
# Both lists are in public domain, available on Github, and are automatically updated weekly.
# They are not meant to replace other public lists in any way. The Top Domains List, in particular, 
# is solely based on DNS queries and doesn’t reflect the popularity of websites.
#

url  <- "https://raw.githubusercontent.com/opendns/public-domain-lists/master/opendns-top-domains.txt"
path <- file.path (tempdir(), "opendns-top-domains.txt")

if (!data_exists ("opendns_top")) {
    
    # download the data, if needed
    if (!file.exists (path)) {
        download.file (url, path)
    }
    
    # uncompress and read the csv data
    opendns_top <- fread (path, header = FALSE)
    setnames (opendns_top, "host")
    
    # clean some of the fields
    opendns_top [, source := "opendns-top-10k"]
    opendns_top [, type   := "legit"]
}