##CTE534_Sentinel2=group
##Directorio=string
##AOI=vector
##Sentinela10m=output raster
##showplots
#libraries
#install.packages("~/Dropbox/0_Paquetes/Sentinel2_1.0.tar.gz", repos=NULL, type="source")
library(Sentinel2)

#Definir directorio de trabajo
setwd(Directorio)
if(file.exists("Sentinela") == FALSE) dir.create("Sentinela")#Carpeta para guardar resultados

Imagen <- list.files(pattern = "L2A", full.names = TRUE)
Sentinela <- readSentinel2(Imagen)
metaSentinela <- readSentinel2Meta(Imagen)
metaSentinela

#Separar según resolución espacial
Sentinela10 <- Sentinela@TenRes
Sentinela20 <- Sentinela@TwentyRes

#Cortar cada brick
Sentinela10m <- crop(Sentinela10, AOI)

#Stack de todas las imágenes
names(Sentinela10m) <- c("B2_BLUE", "B3_GREEN", "B4_RED", "B8_NIR")

plot(Sentinela10m)
