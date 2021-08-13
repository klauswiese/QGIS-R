##CTE534_Índices=group
##Imagen=raster
##RedEdge=number 4
##Red=number 3
##NDVIre=output raster
##showplots

NDVIre <- raster::overlay(Imagen[[RedEdge]], Imagen[[Red]], fun=function(x,y){(x-y)/(x+y)})
plot(NDVIre)