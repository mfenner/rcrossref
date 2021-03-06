context("testing cr_citation")

test_that("cr_citation returns correct class", {
  expect_is(suppressWarnings(cr_citation(doi="10.1371/journal.pone.0042793")), "bibentry")
})

test_that("cr_citation returns correct length", {
  expect_equal(length(suppressWarnings(cr_citation(doi="10.1371/journal.pone.0042793"))), 1)
})

test_that("cr_citation fails correctly", {
  library('httr')
  expect_error(suppressWarnings(cr_citation(doi="10.1371/journal.pone.0042793", config=timeout(0.001))))
  expect_warning(cr_citation(doi="10.1371/journal.pone.0042793"))
})
