##CTE534_ClasificacionSupervisada=group
##Imagen=raster
##Vector=vector
#Directorio=string
##Codigo=field Vector
##Usos=field Vector
#TablaUsos=output table
#CodigoUsos=output table
#EntrenamientoRaster=output raster
#Covariables=output raster
#Trainingbrick=output raster
##ValueTable=output table
#showplots

#showplots
Salida<-raster::extract(Imagen, Vector, df=TRUE)
Vector$ID<-row.names(Vector)
TablaUsos<-merge(Salida, Vector, x.by="ID", by.y="ID")

#Rasterizar
EntrenamientoRaster <- raster::rasterize(Vector, Imagen[[1]], field=Codigo)

#CoVariables cortadas
Covariables <- raster::mask(Imagen, EntrenamientoRaster)

#Training Brick
Trainingbrick <- raster::addLayer(Covariables, EntrenamientoRaster)

#Extraer todos los valores en una matriz
valuetable<- raster::getValues(Trainingbrick)
#Convertir a data frame
valuetable <- as.data.frame(valuetable)
#Eliminar los na
ValueTable  <- na.omit(valuetable)

#usos
Usos <- unique(Vector[[Usos]])
