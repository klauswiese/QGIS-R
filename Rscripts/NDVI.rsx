##CTE534_Índices=group
##Imagen=raster
##Rojo=number
##NIR=number
##NDVI=output raster
##showplots
NDVI <- raster::overlay(Imagen[[Rojo]], 
                        Imagen[[NIR]], 
                        fun=function(x,y){(y-x)/(y+x)})
NDVI
plot(NDVI, 
     main="NDVI", 
     xlab="X", 
     ylab="Y")
