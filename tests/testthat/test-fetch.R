test_that("fetch() retrieves fii data with necessary columns", {
  expected_columns <- c(
    "Códigodo fundo",
    "DY (12M)Média",
    "P/VPA",
    "Liquidez Diária",
    "Preço Atual"
  )

  df = fetch()

  actual_columns <- attributes(df)$names

  expect_true(all(expected_columns %in% actual_columns))
})
