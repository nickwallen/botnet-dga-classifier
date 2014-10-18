

expect_true (1 %nin% c(2,3,4))
expect_true ("foo" %nin% c("bar", "baz"))
expect_true (1 %nin% c())

expect_false (1 %nin% c(1,2,3))
expect_false ("foo" %nin% c("bar", "baz", "foo"))
