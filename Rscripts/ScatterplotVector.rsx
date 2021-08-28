##CTE534_Gráficos=group
##showplots
##Vector=vector
##X=Field Vector
##Y=Field Vector
##Tipo=selection punto;línea;punto&línea
if (Tipo == 0) {
plot(Vector[[X]], 
     Vector[[Y]], 
     xlab=X, 
     ylab=Y)
box()
grid(lwd=1, 
     col="black")
} else if (Tipo == 1) {
plot(Vector[[X]], 
     Vector[[Y]], 
     xlab=X, 
     ylab=Y, 
     type="l")
box()
grid(lwd=1, 
     col="black")
} else if (Tipo == 2) {
plot(Vector[[X]], 
     Vector[[Y]], 
     xlab=X, 
     ylab=Y, 
     type="b")
box()
grid(lwd=1, 
     col="black")
}
