# Per prima cosa creo una lista dei personaggi


personaggi <- rep(NA,length(nodes$Label))

for (i in 1:length(nodes$Label)){
  personaggi[i] <- nodes$Id[i]
}


# Assegno casualmente degli attributi ai personaggi


attributi <- sample(c("Sith", "Jedi", "Jedi2"), length(personaggi), replace = TRUE) # Sith = Infetto, Jedi = Sano, Jedi2 = Guarito
attributi_personaggi <- data.frame(personaggi, attributi)

V(rete)$attributi <- attributi_personaggi$attributi[match(V(rete)$name, attributi_personaggi$personaggi)]



# Simulo l'effetto di propagazione utilizzando il modello SI (Susceptible-Infectious)

nodo_iniziale <- sample(V(rete), 1)  # Imposto un nodo iniziale per l'effetto di propagazione
risultati <- numeric(length(V(rete)))
risultati[nodo_iniziale] <- 1

for (i in 2:length(nodes$Label)) {
  nodi_infetti <- V(rete)[risultati == 1]  # Nodi infetti
  nodi_vicini <- neighbors(rete, nodi_infetti, mode = "all")  # Nodi vicini ai nodi infetti
  
  # Probabilità di infezione basata sugli attributi dei personaggi
  prob_infezione <- ifelse(V(rete)$attributi[nodi_vicini] == "Sith", 0.5, 0.5)
  
  # Genero numeri casuali per determinare se i nodi vicini vengono infettati
  nuovi_infetti <- sample(nodi_vicini, size = sum(rbinom(length(nodi_vicini), 1, prob_infezione)), replace = FALSE)
  
  # Aggiorno lo stato dei nodi nella simulazione
  risultati[nuovi_infetti] <- 1
}


# Calcolo il grado dei nodi

gradi <- degree(rete)

# Definisco le dimensioni dei nodi in base al grado
dimensioni_nodi <- gradi + 1

# Calcolo la disposizione dei nodi utilizzando l'algoritmo Force-Directed (Fruchterman-Reingold)
layout <- layout_with_fr(rete)


# Visualizzo i risultati
plot(rete, vertex.color = ifelse(risultati == 1, "red", "gray"), vertex.label = NA, 
     vertex.size = dimensioni_nodi, layout = layout)




