##CTE534=group
##Imagen=raster
##Vector=vector
##Corte=output raster
Corte <- raster::crop(Imagen, Vector)
Corte
