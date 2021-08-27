##CTE534_Umbrales=group
##Imagen=raster
##Banda=number 1
##Mascara= output raster
##ImagenUmbral= output raster
##showplots
rango <- range(na.omit(c(Imagen[[Banda]][]))) #Encontrar el rango de los datos
#levels <- 100 #Definir el número de niveles posibles
breaks <- seq(rango[1], rango[2], length.out = 100 + 1) #Número de "breaks" basado en niveles y rangos
h <- hist.default(na.omit(c(Imagen[[Banda]][])), breaks = breaks, plot = FALSE) #Crear histograma de datos
counts <- as.double(h$counts) #Observaciones por nivel
mids <- as.double(h$mids) #Media por break
len <- length(counts) #Número total de observaciones
w1 <- cumsum(counts) #Suma acumulada
w2 <- w1[len] + counts - w1 #
cm <- counts * mids
m1 <- cumsum(cm)
m2 <- m1[len] + cm - m1
var <- w1 * w2 * (m2/w2 - m1/w1)^2
maxi <- which(var == max(var, na.rm = TRUE))
otsu <- (mids[maxi[1]] + mids[maxi[length(maxi)]])/2

print(otsu)

hist(as.matrix(na.omit(Imagen[[Banda]])),
     xlab=names(Imagen[[Banda]]),
     ylab="Frecuencia", 
     col="red", 
main=paste("Distribución ", 
           names(Imagen[[Banda]]), 
           sep=""))
abline(v=otsu, 
       col="black", 
       lwd=1, lty=2)
box()
grid(lwd=1)

Mascara <- Imagen[[Banda]] >= otsu
ImagenUmbral <- Mascara * Imagen[[Banda]]
