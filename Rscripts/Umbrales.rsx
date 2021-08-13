##CTE534_Umbrales=group
##Imagen=raster
##Banda=number 1
##Valor1=number
##ImagenUmbral= output raster
##showplots
ImagenUmbral <- reclassify(Imagen[[Banda]], cbind(-Inf, Valor1,NA))
plot(ImagenUmbral)
