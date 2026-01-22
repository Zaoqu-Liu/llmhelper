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
  # When input has a "schema" key, it extracts the schema portion
  schema_only <- list(
    name = "direct_schema",
    schema = list(type = "object")
  )
  
  result <- extract_schema_only(schema_only)
  # Should return the schema portion (list(type = "object"))
  expect_equal(result$type, "object")
  
  # When input has no "schema" key, return as-is
  plain_schema <- list(type = "string", description = "A string field")
  result2 <- extract_schema_only(plain_schema)
  expect_equal(result2$type, "string")
  expect_equal(result2$description, "A string field")
})
