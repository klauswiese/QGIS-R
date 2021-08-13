##CTE534=group
##Imagen=raster
##Vector=vector
##Mascara=output raster
Mascara <- crop(Imagen, Vector)
Mascara <- mask(Imagen, Vector)
Mascara