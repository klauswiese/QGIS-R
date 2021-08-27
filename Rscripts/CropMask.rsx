##CTE534=group
##Imagen=raster
##Vector=vector
##Mascara=output raster
Mascara <- raster::crop(Imagen, Vector)
Mascara <- raster::mask(Imagen, Vector)
Mascara
