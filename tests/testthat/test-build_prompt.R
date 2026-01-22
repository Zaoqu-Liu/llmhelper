test_that("build_prompt correctly substitutes variables", {
  template <- "Hello {name}, your score is {score}."
  result <- build_prompt(template, name = "Alice", score = 100)
  expect_equal(as.character(result), "Hello Alice, your score is 100.")
})

test_that("build_prompt handles empty template", {
  template <- ""
  result <- build_prompt(template)
  expect_equal(as.character(result), "")
})

test_that("build_prompt handles multiple occurrences", {
  template <- "{x} + {x} = {y}"
  result <- build_prompt(template, x = 2, y = 4)
  expect_equal(as.character(result), "2 + 2 = 4")
})

test_that("build_prompt preserves whitespace", {
  template <- "  {text}  "
  result <- build_prompt(template, text = "hello")
  expect_equal(as.character(result), "  hello  ")
})
