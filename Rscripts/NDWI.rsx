##CTE534_Índices=group
##Imagen=raster
##VERDE=number 2
##NIR=number 4
##NDWI=output raster
##showplots

NDWI <- (Imagen[[VERDE]]-Imagen[[NIR]])/(Imagen[[VERDE]] + Imagen[[NIR]])
plot(NDWI, 
     main="NDWI", 
     xlab="X", 
     ylab="Y")
box()
grid(col="black", 
     lwd=1)
