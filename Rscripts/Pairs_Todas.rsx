##CTE534_Gráficos=group
##Imagen=raster
##Título=string Título_Gráfico
##showplots
l <- dim(Imagen)[3]
pairs(Imagen[[1:l]], main=Título, col="darkgreen")