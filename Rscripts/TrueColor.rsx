##CTE534_Gráficos=group
##Imagen=raster
##Azul=number 1
##Verde=number 2
##Rojo=number 3
##Stretch=selection linear;histograma
##showplots
RGB <- stack(Imagen[[Rojo]], Imagen[[Verde]], Imagen[[Azul]])
if (Stretch == 0) {
plotRGB(RGB, axes =TRUE, stretch = "lin", main = "Composición en Color Verdadero")
box()
grid(lwd=1, col="black")
} else if (Stretch == 1) {
plotRGB(RGB, axes =TRUE, stretch = "hist", main = "Composición en Color Verdadero")
box()
grid(lwd=1, col="black")
}