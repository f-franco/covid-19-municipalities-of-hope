library(sf)
library(cartogram)
library(dplyr)
library(tmap)
library(tmaptools)
library(ggplot2)
library(viridis)

wd <- "C:/Users/santa/Desktop/COVID"
setwd(wd)

muni_data <- read.csv("municipios_esperanza.csv")
map_data <- st_read("mun2019gw.shp", stringsAsFactors = FALSE)

map_data$CVEGEO <- as.numeric(map_data$CVEGEO)
muni_data$POB_TOT_2020 <- as.numeric(muni_data$POB_TOT_2020)

combo <- inner_join(map_data, muni_data, by = "CVEGEO")
combo <- st_transform(combo, 6372)

mapa <- cartogram_cont(combo, "POB_TOT_2020", itermax = 20)
mapa_ncont <- cartogram_ncont(combo, "POB_TOT_2020", k = 20)

tm_shape(combo) +
  tm_fill("esp", palette = "-plasma") +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))

tm_shape(map_data) + tm_borders(alpha = 0.03) +
  tm_shape(mapa_ncont) + tm_polygons(lwd = NA, "esp", palette = "-viridis") +
  tm_layout(frame = FALSE, legend.show = FALSE)
