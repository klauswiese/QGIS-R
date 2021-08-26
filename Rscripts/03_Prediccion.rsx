##CTE534_ClasificacionSupervisada=group
##Imagen=raster
##Vector=vector
##Codigo=field Vector
##Usos=field Vector
##Clasificacion=output raster
#showplots
Salida<-raster::extract(Imagen, Vector, df=TRUE)
Vector$ID<-row.names(Vector)
TablaUsos<-merge(Salida, Vector, x.by="ID", by.y="ID")

#Rasterizar
EntrenamientoRaster <- raster::rasterize(Vector, Imagen[[1]], field=Codigo)

#CoVariables
Covariables <- raster::mask(Imagen, EntrenamientoRaster)

#Training Brick
Trainingbrick <- raster::addLayer(Covariables, EntrenamientoRaster)

#Extraer todos los valores en una matriz
valuetable<- raster::getValues(Trainingbrick)
#Convertir a data frame
valuetable <- as.data.frame(valuetable)
#Eliminar los na
ValueTable  <- na.omit(valuetable)


Levels <- length(unique(Vector[[Codigo]]))

#RANDOM FOREST
library(randomForest)

#valuetable <- read.csv("CSV/ValueTable.csv")
modelRF <- randomForest(x = ValueTable[ ,c(1:(dim(ValueTable)[2] - 1))], y=factor(ValueTable$layer),
                        importance = TRUE, type="classification")


Clasificacion <- raster::predict(Imagen, model = modelRF, na.rm = TRUE)
