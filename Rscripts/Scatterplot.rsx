##CTE534_Gráficos=group
##Imagen=raster
##Band1=number
##Band2=number
##Título=string data
##Etiqueta_X=string data
##Etiqueta_Y=string data
##showplots
plot(as.matrix(Imagen[[Band1]]), as.matrix(Imagen[[Band2]]),main=Título,xlab=Etiqueta_X, ylab=Etiqueta_Y, col="red")
box()
grid(lwd=1, col="black")