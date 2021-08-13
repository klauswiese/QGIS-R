##CTE534_Sentinel2=group
##Directorio=string
##AOI=vector
##Sentinela20m=output raster
##showplots
#libraries
#install.packages("~/Dropbox/0_Paquetes/Sentinel2_1.0.tar.gz", repos=NULL, type="source")
library(Sentinel2)

#Definir directorio de trabajo
setwd(Directorio)
Imagen <- list.files(pattern = "L2A", full.names = TRUE)
Sentinela <- readSentinel2(Imagen)
#Separar según resolución espacial
Sentinela20 <- Sentinela@TwentyRes
names(Sentinela20) <- c("B2_BLUE", "B3_GREEN", "B4_RED", "B5_VNIR1", "B6_VNIR2", "B7_VNIR3", "B8A_NIR2", "B11_SWIR1", "B12_SWIR2", "SCL")

#Cortar cada brick
Sentinela20m <- crop(Sentinela20, AOI)
Sentinela20m

plot(Sentinela20m)