##CTE534_Índices=group
##Imagen=raster
##Green=number 2
##SWIR1=number 8
##MNDWI=output raster
##showplots

MNDWI <- raster::overlay(Imagen[[Green]], 
                         Imagen[[SWIR1]], 
                         fun=function(x,y){(x-y)/(x+y)})
plot(MNDWI)
