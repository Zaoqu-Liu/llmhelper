test_that("%||% operator works correctly", {
  expect_equal(NULL %||% "default", "default")
  expect_equal("value" %||% "default", "value")
  expect_equal(NA %||% "default", NA)
  expect_equal(0 %||% "default", 0)
  expect_equal("" %||% "default", "")
})
