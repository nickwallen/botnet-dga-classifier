#
# extracts the sub-domain (aka domain) name of a host URL.  for example,
# "www.amazon.com/path/foo" would result in "amazon" being returned.
#
extract_domain <- function (host, domain_position = 2) {
    
    # extract each of the domains; example: www.amazon.com
    domains <- str_extract (host, "([0-9a-zA-Z-]+\\.)+[0-9a-zA-Z-]+")
    
    # split the subdomains
    subdomains <- strsplit (domains, ".", fixed = TRUE)
    
    # reverse their order to simplify position designation
    subdomains <- lapply (subdomains, rev)
    
    # extract the designated sub-domain
    result <- lapply (subdomains, '[', domain_position)
    
    # simplify the result
    return (unlist (result))
}