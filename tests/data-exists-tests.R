
# expect false, if nothing under the given name exists
expect_false (data_exists ("foo"))
expect_false (data_exists ("bar"))

# expect false, if something exists, but it is not a data.frame
expect_false (data_exists ("ls"))
expect_false (data_exists ("config"))

# expect true, if a data.frame exists in the current environment
data (cars)
expect_true (data_exists ("cars"))

data (iris)
expect_true (data_exists ("iris"))
