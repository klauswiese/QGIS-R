##CTE534_Composite=group
##Imagen=raster
##Azul=number 1
##Verde=number 2
##Rojo=number 3
##Stretch=selection linear;histograma
##showplots
RGB <- raster::stack(Imagen[[Rojo]], Imagen[[Verde]], Imagen[[Azul]])
if (Stretch == 0) {
raster::plotRGB(RGB, axes =TRUE, stretch = "lin", main = "Composición en Color Verdadero")
box()
grid(lwd=1, col="black")
} else if (Stretch == 1) {
raster::plotRGB(RGB, axes =TRUE, stretch = "hist", main = "Composición en Color Verdadero")
box()
grid(lwd=1, col="black")
}
