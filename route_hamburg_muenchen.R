library(osrm)
library(sp)
library(raster)

setwd("C:/work/rabbits")

de<-readRDS("gadm36_DEU_0_sp.rds")

plot(de)

route <- osrmRoute(src = c(10, 53.5697),
                    dst = c(11.57672, 48.13788),
                    returnclass = "sf")

route$distance

geom<-route$geometry[[1]]

lines(geom[,1],geom[,2], col="red", lwd=5)

text(10, 53.5697, "Hamburg", col="red", pos=3)
text(11.57672, 48.13788, "München", col="red", pos=1)
