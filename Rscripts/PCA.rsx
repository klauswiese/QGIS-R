##CTE534_PCA=group
##Imagen=raster
##UltimaBanda=number 9
##Muestra=number 500
##PCA=output raster
##showplots

sr <- sampleRandom(Imagen[[1:UltimaBanda]], Muestra)
pca <- prcomp(sr, scale =TRUE)
screeplot(pca)


PCA <- predict(Imagen[[1:UltimaBanda]], pca, index = 1:UltimaBanda)
par(mfrow=c(2,2))
plot(PCA[[1]])
plot(PCA[[2]])
plot(PCA[[3]])
#plot(PCA[[4]])