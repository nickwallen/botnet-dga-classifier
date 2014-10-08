
# valid URLs that should successfully parse
expect_equal (extract_domain ("http://www.amazon.com/path"), "amazon")
expect_equal (extract_domain ("http://amazon.com/path"),     "amazon")
expect_equal (extract_domain ("http://amazon.com"),          "amazon")
expect_equal (extract_domain ("www.amazon.com/path"),        "amazon")
expect_equal (extract_domain ("amazon.com/path"),            "amazon")
expect_equal (extract_domain ("www.amazon.com/"),            "amazon")
expect_equal (extract_domain ("www.amazon.com"),             "amazon")
expect_equal (extract_domain ("amazon.com"),                 "amazon")

# validate with vectorized input
input <- c("www.amazon.com/path", "http://amazon.com/path", "amazon.com/path")
expect_equal (extract_domain (input), rep ("amazon", 3))

# invalid URLs that should NOT successfully parse
expect_equal (extract_domain (".com"),                       NA_character_)
expect_equal (extract_domain ("http://.com"),                NA_character_)
expect_equal (extract_domain ("http://.com/path"),           NA_character_)
expect_equal (extract_domain ("domain with spaces.com"),     NA_character_)

# validate with vectorized input
input <- c(".com", "http://.com", "http://.com/path")
expect_equal (extract_domain (input), rep (NA_character_, 3))


