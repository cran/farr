library(dplyr, warn.conflicts = FALSE)

test_that("get_ff_ind(5) works", {
  skip_on_cran()

  expect_equal(get_ff_ind(5) %>%
                   select("ff_ind") %>%
                   distinct() %>%
                   pull() %>%
                   length(), 4)
})
