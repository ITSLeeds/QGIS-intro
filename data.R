# Aim: generate input data for the QGIS module


# set-up
released_files = piggyback::pb_list()
piggyback::pb_download(released_files$file_name)
unzip("data.zip")
library(dplyr)
library(sf)

zones = read_sf("leeds_lsoa.shp")
existing = sf::read_sf("existing-cycle-infrasture-leeds.geojson")
u = "https://github.com/npct/pct-outputs-regional-notR/raw/master/commute/msoa/west-yorkshire/l.geojson"
download.file(u, destfile = "l.geojson")
desire_lines_leeds = read_sf("l.geojson")
desire_lines_wy_200 = desire_lines_leeds %>%
  top_n(n = 200, wt = all)
mapview::mapview(desire_lines_wy_200) +
  mapview::mapview(zones)
write_sf(desire_lines_wy_200, "desire_lines_wy_200.geojson")

data_accessibility = c("desire_lines_wy_200.geojson", "existing-cycle-infrasture-leeds.geojson")
zip(zipfile = "data_accessibility.zip", files = data_accessibility)
piggyback::pb_upload("data_accessibility.zip")
