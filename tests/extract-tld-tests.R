
# valid URLs that should successfully parse
expect_equal (extract_tld ("http://www.amazon.com/path"), "com")
expect_equal (extract_tld ("http://amazon.com/path"),     "com")
expect_equal (extract_tld ("http://amazon.com"),          "com")
expect_equal (extract_tld ("www.amazon.com/path"),        "com")
expect_equal (extract_tld ("amazon.com/path"),            "com")
expect_equal (extract_tld ("www.amazon.com/"),            "com")
expect_equal (extract_tld ("www.amazon.com"),             "com")
expect_equal (extract_tld ("amazon.com"),                 "com")

# validate with vectorized input
input <- c("www.amazon.com/path", "http://amazon.com/path", "amazon.com/path")
expect_equal (extract_tld (input), rep ("com", 3))

# invalid URLs that should NOT successfully parse
expect_equal (extract_tld (".com"),                       NA_character_)
expect_equal (extract_tld ("http://.com"),                NA_character_)
expect_equal (extract_tld ("http://.com/path"),           NA_character_)

# validate with vectorized input
input <- c(".com", "http://.com", "http://.com/path")
expect_equal (extract_tld (input), rep (NA_character_, 3))
