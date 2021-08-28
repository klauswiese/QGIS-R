##CTE534_Gráficos=group
##Imagen=raster
##Título=string Título_Gráfico
##showplots
library(raster)
l <- dim(Imagen)[3]
pairs(Imagen[[1:l]], main=Título, col="darkgreen")
