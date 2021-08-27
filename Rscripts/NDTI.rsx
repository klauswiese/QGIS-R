##CTE534_Índices=group
##Imagen=raster
##SWIR1=number 8
##SWIR2=number 9
##NDTI=output raster
##showplots

NDTI <- raster::overlay(Imagen[[SWIR1]], 
                        Imagen[[SWIR2]], 
                        fun=function(x,y){(x-y)/(x+y)})
plot(NDTI)
