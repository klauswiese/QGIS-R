##CTE534_Gráficos=group
##Imagen=raster
##Banda=number 1
##showplots
library(ggplot2)

qplot(c(Imagen[[Banda]][]), geom="histogram") + 
          xlab(names(Imagen[[Banda]])) + 
          ylab("Frecuencia")
