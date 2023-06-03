# CODICE PER CREARE LA DISTRIBUZIONE DEL GRADO DEI NODI E LA DISTRIBUZIONE ESPONENZIALE CHE APPROSSIMA

# Estraggo la colonna dei gradi dal dataset


grado <- dati_starwars$degree


# Costruisco l'istogramma

hist(grado, breaks = c(0,12,24,36,48), prob = T, main = 'Distribuzione del grado dei nodi e distribuzione esponenziale che approssima',
     col.main = 'red', xlab = 'grado dei nodi', ylab = 'Densità di probabilità', col = 'light green', xlim = c(0,60), ylim = c(0,0.07))


# Sovrappongo all'istogramma la densità della distribuzione esponenziale che esso approssima

curve(dexp(x, rate = (112/sum(grado))), lwd = 3, col = 'dark green', add = T)


