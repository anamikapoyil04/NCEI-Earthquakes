context("test-earqke_map")

test_that("multiplication works", {

  # Path to raw data
  raw_data_path <- system.file("extdata", "signif.txt", package = "NCEIEarthquakes")

  # Loading the raw data
  raw_data <- readr::read_delim(file = raw_data_path, delim = "\t")

  # Cleaning.
  df_clean <- raw_data %>% earqke_clean_data()

  # Creating a map
  curious <- df_clean %>% earqke_map('DATE')

  # Checking the object.
  expect_that(class(curious)[1], equals("leaflet"))
})
