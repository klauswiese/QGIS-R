##CTE534_Gráficos=group
##Imagen=raster
##Band1=number 1
##Band2=number 2
##Título=string Titulo
##Etiqueta_X=string EtiquetaX
##Etiqueta_Y=string EtiquetaY
##showplots
require(ggplot2)
ggplot()+
geom_point(aes(x=as.numeric(Imagen[[Band1]][])),y=as.numeric(Imagen[[Band2]][]))+
theme(legend.title = element_blank())+
xlab(Etiqueta_X)+ ylab(Etiqueta_Y)