library(raster)
library(ggmap)
adm1 <- getData('GADM', country='DEU', level=0)
adm2 <- getData('GADM', country='DEU', level=1)

lat <- c(47,55)
long <- c(5,16)
bbox <- make_bbox(long,lat,f=0.05)
deu <- get_map(bbox,source="osm")

temp <- fortify(adm1)

ggmap(deu)+
  geom_map(data = temp, map = temp,
           aes(x = long, y = lat, group = group, map_id = id),
           color = "black", size = 0.2, alpha=0.5)


