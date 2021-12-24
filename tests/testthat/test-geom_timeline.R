context("test-geom_timeline")

test_that("Plot a Example using data of Brazil and Japan." {

  # Loading Libraries to perform this test.
  library(magrittr)
  library(msdr)
  library(ggplot2)
  library(testthat)

  # Path to raw data
  raw_data_path <- system.file("extdata", "signif.txt", package = "NCEIEarthquakes")

  # Loading the raw data
  raw_data <- readr::read_delim(file = raw_data_path, delim = "\t")

  # Cleaning.
  df_clean <- raw_data %>% earqke_clean_data()

  # Checking the type of object. Should be ggplot.
  expect_is(df_clean %>%
              dplyr::filter(YEAR > 2010,
                            COUNTRY %in% c('BRAZIL',
                                           'JAPAN')) %>%
              ggplot2::ggplot() +
              NCEIEarthquakes::geom_timeline(ggplot2::aes(x = DATE,
                                               y = COUNTRY,
                                               size = EQ_PRIMARY,
                                               color = TOTAL_DEATHS)), "ggplot")
})
