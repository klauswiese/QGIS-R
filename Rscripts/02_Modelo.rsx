##CTE534_ClasificacionSupervisada=group
##Imagen=raster
##Vector=vector
##Codigo=field Vector
##Usos=field Vector
##TablaUsos=output table
#CodigoUsos=output table
##EntrenamientoRaster=output raster
##Covariables=output raster
##Trainingbrick=output raster
##ValueTable=output table
##Matriz_de_Confusion=output table
##showplots

Salida<-raster::extract(Imagen, Vector, df=TRUE)
Vector$ID<-row.names(Vector)
TablaUsos<-merge(Salida, Vector, x.by="ID", by.y="ID")

#Rasterizar
EntrenamientoRaster <- rasterize(Vector, Imagen[[1]], field=Codigo)

#CoVariables
Covariables <- mask(Imagen, EntrenamientoRaster)

#Training Brick
Trainingbrick <- addLayer(Covariables, EntrenamientoRaster)

#Extraer todos los valores en una matriz
valuetable<- getValues(Trainingbrick)
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


#Inspeccionar la matriz de confusión del el analisís del error OOB
modelRF$confusion
clasificacion <- sort(unique(Vector[[Usos]]))

#Matriz de confusion
Matriz_de_Confusion <- data.frame(modelRF$confusion)
names(Matriz_de_Confusion)[1:Levels] <- clasificacion
#row.names(Matriz_de_Confusion) <- clasificacion
Matriz_de_Confusion

#Importancia variables
varImpPlot(modelRF)
