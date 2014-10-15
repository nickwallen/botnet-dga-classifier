
expect_close (dictionary_words ("facebook"), 0.19)
expect_close (dictionary_words ("washington"), 0.22)
expect_close (dictionary_words ("a"), 0)
expect_close (dictionary_words ("at"), 0)
expect_close (dictionary_words ("art"), 1)
expect_close (dictionary_words (""), 0)
expect_close (dictionary_words ("xyzxyzxyz"), 0)
