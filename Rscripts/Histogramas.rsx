##CTE534_Gráficos=group
##Imagen=raster
##Banda=number 1
##showplots
library(ggplot2)
#hist(as.matrix(Imagen),main=Data_Name,xlab="Banda",ylab="Frecuencia", col="red")
#plot_ly(x = ~c(Imagen[[Banda]][]), type = "histogram")
qplot(c(Imagen[[Banda]][]), geom="histogram") + xlab(names(Imagen[[Banda]])) + ylab("Frecuencia")