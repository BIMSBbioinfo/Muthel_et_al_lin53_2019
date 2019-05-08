# get the gene list from Metabolic pathways for c.elegans in KEGG

library(org.Ce.eg.db)

pathway_id <- '01100' #cel01100 for metabolic pathways

#get entrez ids for the given pathway id
entrez_ids <- unique(as.data.table(org.Ce.eg.db::org.Ce.egPATH)[path_id == '01100']$gene_id)

# map entrez ids to gene names
eg2gene <- as.data.table(org.Ce.eg.db::org.Ce.egALIAS2EG)

genenames <- eg2gene[gene_id %in% entrez_ids]$alias_symbol

#convert gene names 
genenames.df <- gProfileR::gconvert(genenames, organism = 'celegans')

writeLines(text = as.character(genenames.df$name), con = './data/genesets/metabolic_pathways_genes.kegg.txt')


get_coord <- function(g) {
  x <-as.data.table(geneCoords)[gene_name == g][,1:3]
  paste0(x$seqnames, ":", x$start, "-", x$end)
}
