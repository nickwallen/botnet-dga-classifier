
#
# a function that simply sets the method to 'curl'
# if it is installed.  this is only necessary because
# curl is required when using HTTPS on a Mac.
#
download.file <- function (url, path, ...) {
  
  # curl is required when using HTTPS on a mac
  # use curl if it is installed, otherwise, let 
  # utils::download.file choose the method
  if (system("curl --help > /dev/null") == 0L) 
    utils::download.file (url, path, method = "curl", ...)
  else
    utils::download.file (url, path, ...)
}