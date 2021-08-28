##CTE534_Gráficos=group
##Imagen=raster
##Band1=number 1
##Band2=number 2
##Título=string Título_Gráfico
##showplots
library(raster)

pairs(Imagen[[c(Band1,Band2)]], main=Título, col="darkgreen")
