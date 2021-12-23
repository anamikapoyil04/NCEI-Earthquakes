#' earqke_map
#'
#' This function plots a straightforward map using circles to determine the earthquake location. The radius
#' of the circle is according to the magnitude (in Richter Scale) of the earthquake.
#'
#' @param df_map A DataFrame with DATE, LONGITUDE, LATITUDE, and EQ_PRIMARY columns.
#'
#' @param annot_col The information to be displayed inside of the popup.
#'
#' @importFrom magrittr %>%
#'
#' @importFrom leaflet addTiles addCircles
#'
#' @importFrom rlang .data
#'
#' @return A map with earthquakes as circles.
#'
#' @examples
#'
#' \dontrun{
#' # Assuming the my_dataset has DATE, LONGITUDE, LATITUDE, and EQ_PRIMARY columns.
#' my_dataset %>% earqke_map(annot_col = "DATE")
#'
#' # Full example.
#' readr::read_delim("inst/extdata/signif.txt",
#'                  delim = "\t") %>%
#'                      earqke_map_clean_data() %>%
#'                          dplyr::filter(COUNTRY == "MEXICO" &
#'                                        lubridate::year(DATE) >= 2000) %>%
#'                                            earqke_map_map(annot_col = "DATE")}
#'
#' @export
earqke_map <- function(df_map = rlang::.data, annot_col) {

# Using Leaflet to plot a map.
leaflet::leaflet(df_map) %>%
leaflet::addTiles() %>%
# Adding circles in each Earthquake point.
leaflet::addCircles(lng = ~LONGITUDE,
                    lat = ~LATITUDE,
                    weight = 1,
                    radius = ~EQ_PRIMARY * 20000,
                    # Plotting a simple information inside of the popup.
                    popup = ~eval(parse(text = annot_col)) ) -> map_to_plot

  # Returning the map with circles.
  return(map_to_plot)
}
