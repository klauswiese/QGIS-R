##CTE534_EDA=group
##Imagen=raster
##Vector=vector
##Campo=field Vector
##Puntos=number 50
##Salida= output table
##Media_Usos= output table
##Tipo=selection Regular;Aleatorio
##showplots
library(sp)
if (Tipo == 0) {
ptsamp<-spsample(Vector,Puntos,type="regular")
class <- over(ptsamp, Vector)
ptsamp$class <- class[[Campo]]
Salida<-extract(Imagen, ptsamp)

ms <- aggregate(Salida,list(ptsamp$class),mean)
# instead of the first column, we use row names
rownames(ms) <- ms[,1]
Media_Usos <- ms[,-1]
Media_Usos



#transform ms from a data.frame to a matrix
ms <-as.matrix(Media_Usos)
# First create an empty plot
plot(0, ylim=c(0,max(Media_Usos)), xlim =c(0,dim(Media_Usos)[2]), type='n', xlab="Bandas", ylab = "Reflectividad")# 
# add the different classes
for(i in 1:nrow(ms)){
  lines(ms[i,], type = "l", lwd = 3, lty = 1, col=i)
  }
# Title
title(main="Perfil Espectral", font.main = 2)
# Legend
legend("topleft",rownames(ms),cex=0.8, col=c(1:nrow(ms)), lty = 1, lwd =3, bty = "n")




} else if (Tipo == 1) {
ptsamp<-spsample(Vector,Puntos,type="random")
class <- over(ptsamp, Vector)
ptsamp$class <- class[[Campo]]
Salida<-extract(Imagen, ptsamp)

ms <- aggregate(Salida,list(ptsamp$class),mean)
# instead of the first column, we use row names
rownames(ms) <- ms[,1]
Media_Usos <- ms[,-1]
Media_Usos

#transform ms from a data.frame to a matrix
ms <-as.matrix(Media_Usos)
# First create an empty plot
plot(0, ylim=c(0,max(Media_Usos)), xlim =c(0,dim(Media_Usos)[2]), type='n', xlab="Bandas", ylab = "Reflectividad")# 
# add the different classes
for(i in 1:nrow(ms)){
  lines(ms[i,], type = "l", lwd = 3, lty = 1, col=i)
  }
# Title
title(main="Perfil Espectral", font.main = 2)
# Legend
legend("topleft",rownames(ms),cex=0.8, col=c(1:nrow(ms)), lty = 1, lwd =3, bty = "n")
}






