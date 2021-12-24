# NCEI-Earthquakes

#### Tags
* Author       : Anamika P
* Date         : 23-12-21
* Course       : Mastering Software Development in R Specialization Capstone
* Project      : Capstone Project

#### Installation

You can use this package installing it by the use of [`devtools`][url_devtools] library from R.

```
# Downloading the package
devtools::install_github("anamikapoyil04/NCEI-Earthquakes")

# Loading the library
library(NCEIEarthquakes)
```

[url_devtools]: https://cran.r-project.org/web/packages/devtools/index.html

********************************************************************************

## Introduction

This package is the Week 6 assignment of the course "Mastering Software Development in R Capstone".

### Description

The package is tailored to work with the [NOAA][noaa_website] (National Oceanic Atmospheric Administration) [Earthquake database][noaa_earthquake].

[noaa_website]: https://www.ngdc.noaa.gov
[noaa_earthquake]: https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1

This database has 6,086 observations and 47 features (database downloaded in 20/feb/2019), which 4,283 observations are about earthquake and 1,803 with `FLAG_TSUNAMI` as true.

From this 4,283 observations, there are 27 with negative `YEAR` and 4,256 with positives values. Finally, from this last subset 1,305 observations have no `EQ_PRIMARY` (Magnitude in [Richter Scale][ritcher_scale]), which means they are recorded as `NA`, so there are only 2,951 valid observations.

[ritcher_scale]: https://simple.wikipedia.org/wiki/Richter_scale

### Objectives

Develops a new package capable to plot a timeline using the ggplot2 as bedrock, with a function to create maps ([OpenStreet maps][openstreet_url]) and earthquake information.

[openstreet_url]: https://www.openstreetmap.org

### Functions

The package has 6 functions and a theme.

#### `earqke_clean_data`

This function loads a given file_name and then performs the data cleaning. Undercover of this process these functions call the `earqke_location_clean` to creates a new column called `LOCATION`.

Have in mind, this function also perfoms the conversion of data to the proper class type.

#### `earqke_create_label`

Combines three columns to creates a new one with `HTML` structure, this is necessary because the Leaflet package requires the data to be displayed inside of the popup as HTML format.

#### `earqke_location_clean`

Adds the `LOCATION` column. The dataset must have the `LOCATION_NAME`. If not, the function will not work properly.

#### `earqke_map`

Draw an OpenStreet Map and circles representing the earthquake's location. The popups show the date of the event. All this feature built over the [Leaflet][url_leaflet] package.

[url_leaflet]: https://rstudio.github.io/leaflet/

#### `geom_timeline`

Plot a timeline based on magnitude (`EQ_PRIMARY`) and total deaths (`TOTAL_DEATHS`).

#### `geom_timeline_label`

Given a plot of `geom_timeline`, this function annotates labels to the `n_max` earthquakes with the highest magnitude (`EQ_PRIMARY`).

#### `theme_earqke`

A theme to remove the background, grid, axis ticks, etc. Aims to increase the ink ratio of the plot.
