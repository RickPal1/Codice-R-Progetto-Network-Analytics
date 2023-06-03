# Carico i pacchetti necessari

library(igraph)
library(igraphdata)
library(Matrix)

# Importo i nodi e gli archi della rete

nodes <- read.csv("NodiSW.csv", header = T, as.is = T)
edges <- read.csv("ArchiSW.csv", header = T, as.is = T)


# Creo la rete

rete <- graph_from_data_frame(d = edges, directed = F)


# Trovo le clique massimali della rete

cliques <- max_cliques(rete)

# Trovo la clique massima della rete

largest_cliques(rete)

