##CTE534_Clasificación_No_Superisada=group
##Imagen=raster
##Banda=number 1
##Centros=number 10
##Iteracciones=number 500
##Inicio=number 5
##Cluster= output raster
##Algortimo=selection HartiganWong;Lloyd;Forgy;MacQueen
##showplots

nr <- getValues(Imagen[[Banda]])
set.seed(99)


if (Algortimo == 0) {
cluster <- kmeans(na.omit(nr), centers = Centros, iter.max = Iteracciones, nstart = Inicio, algorithm="Hartigan-Wong")
} else if (Algortimo == 1) {
cluster <- kmeans(na.omit(nr), centers = Centros, iter.max = Iteracciones, nstart = Inicio, algorithm="Lloyd")
} else if (Algortimo == 2) {
cluster <- kmeans(na.omit(nr), centers = Centros, iter.max = Iteracciones, nstart = Inicio, algorithm="Forgy")
} else if (Algortimo == 3) {
cluster <- kmeans(na.omit(nr), centers = Centros, iter.max = Iteracciones, nstart = Inicio, algorithm="MacQueen")
}

Cluster <- setValues(Imagen[[Banda]], cluster$cluster)

par(mfrow =c(1,2))
plot(Imagen[[Banda]], col =rev(terrain.colors(Centros)), main = names(Imagen[[Banda]]))
plot(Cluster, main = 'Clasificación No Supervisada \n (Kmeans)')