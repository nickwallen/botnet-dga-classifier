
#
# Alexa maintains a freely available list of the top 1 million sites available
# as a CSV download.  Let's assume that no Botnets make it into the top 1 million.
#

url  <- "http://s3.amazonaws.com/alexa-static/top-1m.csv.zip"
path <- file.path (tempdir(), "alexa-top-1m.csv.zip")

if (!data_exists ("alexa")) {

    # download the data, if needed
    if (!file.exists (path)) {
        download.file (url, path)
    }
    
    # unzip and read the csv data
    csv <- unzip (path, exdir = tempdir())
    alexa <- fread (csv)    
    setnames (alexa, c("rank", "host"))

    # clean some of the fields
    alexa [, rank   := NULL]
    alexa [, source := "alexa"]
    alexa [, type   := "legit"]
    
    # some contain a path which needs to be excluded 
    # 'gits.hoolay.cn/user/settings' -> 'gits.hoolay.cn'
    alexa [, host := str_extract (host, "[^/]+")]
}

