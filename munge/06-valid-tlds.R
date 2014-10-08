#
# IANA maintains a list of all valid TLDs.  these can be used to validate the
# domain information to exclude any bad data.
#

url <- "http://data.iana.org/TLD/tlds-alpha-by-domain.txt"
path <- file.path (tempdir(), "tlds-alpha-by-domain.txt")

# download the data, if needed
if (!file.exists (path)) {
    download.file (url, path)
}

# fetch and load the valid TLD data
valid_tlds <- fread (path)
setnames (valid_tlds, "tld")

# lower-case each of them
valid_tlds [, tld := tolower (tld)]
