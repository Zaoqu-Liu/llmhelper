test_that("extract_schema_only extracts schema correctly", {
  schema_result <- list(
    schema = list(
      name = "test_schema",
      schema = list(type = "object", properties = list())
    ),
    description = "A test schema",
    iterations = 1
  )
  
  result <- extract_schema_only(schema_result)
  expect_true("name" %in% names(result))
  expect_equal(result$name, "test_schema")
})

test_that("extract_schema_only handles already extracted schema", {
  schema_only <- list(
    name = "direct_schema",
    schema = list(type = "object")
  )
  
  result <- extract_schema_only(schema_only)
  # Should return the input when no nested schema
  expect_equal(result$name, "direct_schema")
})
