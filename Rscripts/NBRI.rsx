##CTE534_Índices=group
##Imagen=raster
##NIR=number 4
##SWIR2=number 10
##NBRI=output raster
##showplots

NBRI <- raster::overlay(Imagen[[NIR]], 
                        Imagen[[SWIR2]], 
                        fun=function(x,y){(x-y)/(x+y)})
plot(NBRI)
