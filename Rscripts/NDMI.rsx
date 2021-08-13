##CTE534_Índices=group
##Imagen=raster
##NIR=number 4
##SWIR2=number 10
##NDMI=output raster
##showplots

NDMIsentinel <- function(NIR, SWIR11){
  fNDMI <- function(x,y){(x-y)/(x+y)}
  NDMI <- overlay(NIR, SWIR11, fun=fNDMI)
  return(NDMI)
}