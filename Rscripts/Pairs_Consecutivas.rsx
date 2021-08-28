##CTE534_Gráficos=group
##Imagen=raster
##Desde=number
##Hasta=number
##Título=string Título_Gráfico
##showplots
library(raster)
pairs(Imagen[[Desde:Hasta]], main=Título, col="darkgreen")
