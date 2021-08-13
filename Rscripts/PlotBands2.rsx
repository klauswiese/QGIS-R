##CTE534_Gráficos=group
##Imagen=raster
##Banda1=number 1
##Banda2=number 2
##Banda3=number 3
##Banda4=number 4
##showplots
par(mfrow =c(2,2))
plot(Imagen[[Banda1]], main = names(Imagen[[Banda1]]), col = gray(0:100 / 100))
plot(Imagen[[Banda2]], main = names(Imagen[[Banda2]]), col = gray(0:100 / 100))
plot(Imagen[[Banda3]], main = names(Imagen[[Banda3]]), col = gray(0:100 / 100))
plot(Imagen[[Banda4]], main = names(Imagen[[Banda4]]), col = gray(0:100 / 100))