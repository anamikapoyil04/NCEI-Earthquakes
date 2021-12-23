#' geom_timeline
#'
#' This method creates a layer to plot the output of GeomTimeline function.
#'
#' @importFrom ggplot2 layer
#'
#' @inheritParams ggplot2::geom_point
#'
#' @return Creates a layer to plot the GeomTimeline output function. Updates the
#'         graphic inserting new content/visuals.
#'
#' @examples
#'
#' \dontrun{
#' ## Full example of geom_timeline using eq_clean_data function to load the raw data and clean it.
#'
#' # Loading and cleaning. Later subsetting the data.
#' df_earth <- eq_clean_data(file_name = 'inst/extdata/signif.txt') %>%
#'     dplyr::filter(YEAR > 2010,
#'                   COUNTRY %in% c("CHINA","JAPAN")) %>%
#'                        dplyr::select(DATE,
#'                        COUNTRY,
#'                        EQ_PRIMARY,
#'                        TOTAL_DEATHS,
#'                        LOCATION) %>%
#'
#'     ggplot2::ggplot() +
#'         geom_timeline(aes(x = DATE,
#'                           y = COUNTRY,
#'                           size = EQ_PRIMARY,
#'                           color = TOTAL_DEATHS))}
#'
#' @export
geom_timeline <- function(mapping = NULL,
                          data = NULL,
                          stat = "identity",
                          position = "identity",
                          na.rm = FALSE,
                          show.legend = NA,
                          inherit.aes = TRUE, ...){

ggplot2::layer(geom = GeomTimeline,
               mapping = mapping,
               data = data,
               stat = stat,
               position = position,
               show.legend = show.legend,
               inherit.aes = inherit.aes,
               params = list(na.rm = na.rm,...)
  )
}
