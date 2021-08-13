##CTE534_Sentinel2=group
##Directorio=string
#libraries
#install.packages("~/Dropbox/0_Paquetes/Sentinel2_1.0.tar.gz", repos=NULL, type="source")
library(Sentinel2)

#Definir directorio de trabajo
setwd(Directorio)

Imagen <- list.files(pattern = "L2A", full.names = TRUE)
Sentinela <- readSentinel2(Imagen)
Metadatos <- readSentinel2Meta(Imagen)
Metadatos