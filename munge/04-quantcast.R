
#
# Quantcast maintains a freely available list of the top 1 million sites available
# as a CSV download.  Let's assume that no Botnets make it into the top 1 million.
#
# https://www.quantcast.com/top-sites
#

url  <- "https://ak.quantcast.com/quantcast-top-million.zip"
path <- file.path (tempdir(), "quantcast-top-million.zip")

if (!data_exists ("quantcast")) {
    
    # download the data, if needed
    if (!file.exists (path)) {
        download.file (url, path)
    }
    
    # unzip and read the csv data
    csv <- unzip (path, exdir = tempdir())
    quantcast <- fread (csv, skip = 6)    
    setnames (quantcast, c("rank", "host"))
    
    # exclude any fields that have spaces (does exist for some reason)
    quantcast <- quantcast [ !str_detect (quantcast$host, "[[:blank:]]+") ]
    
    # clean some of the fields
    quantcast [, rank   := NULL]
    quantcast [, source := "quantcast"]
    quantcast [, type   := "legit"]
}

