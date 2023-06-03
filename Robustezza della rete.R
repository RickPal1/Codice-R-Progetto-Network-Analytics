# CODICE PER TESTARE LA ROBUSTEZZA DELLA RETE



# Calcolo la dimensione della componente connessa più grande (Giant Component)
Giant_component <- max(components(rete)$csize)


# Rimuovo un personaggio per simulare una sparizione/eliminazione
personaggio_eliminato <- "Yoda"
grafo_senza_Yoda <- delete_vertices(rete, V(rete)[name == personaggio_eliminato])


# Calcolo la dimensione della componente connessa più grande dopo la modifica
Giant_component_nuova <- max(components(grafo_senza_Yoda)$csize)
