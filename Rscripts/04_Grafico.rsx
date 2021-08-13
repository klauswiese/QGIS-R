##CTE534_ClasificacionSupervisada=group
##Imagen=raster
##Vector=vector
##Usos=field Vector
##Color=string
##Pixel=number 10
##Directorio=string
##Data=output table
##showplots
library(tidyverse)

U <- Vector[[Usos]]

Ta <- data.frame(Us = U)
Ta <- data.frame(arrange(Ta, Us))

Data <- data.frame(table(Imagen[]), Uso = Ta$Us)#
Data$Area_m2 <- Data$Freq*Pixel*Pixel
Data$Area_ha <- Data$Freq*Pixel*Pixel/10000
Data$Porcentaje <- round(Data$Area_ha*100/sum(Data$Area_ha),2)
Data$Etiqueta <- paste(Data$Porcentaje, " %", sep="")

#Gráfico
bplt <- barplot(Data$Porcentaje)


setwd(Directorio)
png(width=1000)
barplot(Data$Porcentaje, col=Color, xlab="", ylab="Área Total (%)", 
        names.arg=Ta$Us,
        main="Cobertura Vegetal y Uso del Suelo",
        ylim=c(0,40), cex.lab=1.2)
grid(lwd=1, col="black")
text(y= Data$Porcentaje, x= bplt, labels=as.character(Data$Etiqueta), xpd=TRUE, pos=3, cex=1.5)
box()
dev.off()

barplot(Data$Porcentaje, col=Color, xlab="", ylab="Área Total (%)", 
        names.arg=Ta$Us,
        main="Cobertura Vegetal y Uso del Suelo",
        ylim=c(0,40), cex.lab=1.2)
grid(lwd=1, col="black")
text(y= Data$Porcentaje, x= bplt, labels=as.character(Data$Etiqueta), xpd=TRUE, pos=3, cex=1.5)
box()