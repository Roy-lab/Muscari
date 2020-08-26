# Muscari
### MUSCARI (Multi-task Spectral Clustering AlgoRIthm)

Muscari uses both the phylogenetic relationship between species and the graph-based nature of co-expression matrices to define co-expression modules (sub-networks) across species. This strategy allows us to identify matched modules across species and has a significant benefit over independent clustering of co-expression networks. Muscari is based on the Arboretum-HiC (https://doi.org/10.1186/s13059-016-0962-8) multi-task graph clustering algorithm, which defines each task as a spectral graph clustering problem, one for each species, and the the multi-task learning framework simultaneously searches for groups of genes that are interacting in multiple species while accounting for the phylogenetic relationship between species. Unlike Arboretum-HiC, Muscari inputs are gene expression matrices, which are converted into fully-connected weighted gene co-expression networks, i.e. every genes have edges with every other genes but differently weighted.
![muscari cartoon](http://pages.discovery.wisc.edu/~jshin/multi-species-proteome/muscari_cartoon.png | width=525)
