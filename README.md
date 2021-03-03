# Introduction

The purpose of this repository is to provide the scripts that are used to produce the figures related to the analysis of ChIP-seq and RNA-seq datasets for the manuscript 
by Müthel, S. et al. 

# Data 

## ChIP-Seq Peaks
The ChIP-Seq sequencing data was processed using the PiGx-ChIPseq pipeline (version 0.0.16). 

The resulting peak sets are in two different folders:
 
**MACS peaks**, contain peaks detected in each sample using MACS peak caller. 
**IDR (irreproducible discovery rate) peaks** contain peaks detected based on sample replicates. 

The settings and sample sheet files used to run this pipeline can be found under `./data/chipseq`. 

See PiGx-ChIPseq documentation for more information: http://bioinformatics.mdc-berlin.de/pigx_docs/pigx-chip-seq.html#pigx-chip-seq

## RNA-seq read counts 

The RNA-seq data was processed using the PiGx-RNAseq pipeline (version 0.0.4). 

We use the Salmon quantified gene-level raw read counts used for the analyses here. 

The raw read counts along with settings and sample sheet files can be found under `./data/rnaseq/` folder. 

See PiGx-RNAseq documentation for more information: http://bioinformatics.mdc-berlin.de/pigx_docs/pigx-rna-seq.html

## genesets

This is a list of gene sets compiled either manually or using scripts. The metabolic genes from the KEGG Metabolic pathways for C.elegans was compiled using the script "get_kegg_genes.R". 

# Vignette

./makeManuscriptFigures.Rmd : takes as input ChIPseq peaks and RNA-seq read counts and produces some figures and an html report. 

To render the vignette type:

> Rscript ./render.vignette.R

# Results

./results.2019.05.09 folder points to the results obtained at the time of the publication of the study. 

The folder contains two HTML reports: 
- `manuscript_analysis.html` contains the figures and tables as used for the manuscript using log2FoldChange threshold of 0.5 and FDR threshold of 0.05. 
- `manuscript_analysis.stricter_thresholds.html` contains the same analysis using stricter log2FoldChange (1) and FDR (0.001) thresholds. 

Other folders starting with `results` followed by a date correspond to reanalysis of the same input on different dates because of for instance bug fixes due to package updates. 

## Required R packages for running the vignette

### CRAN packages

> install.packages(c('ggplot2', 'ggfortify', 'VennDiagram', 'gprofiler2', 'UpSetR', 'DT', 'reshape2', 'data.table', 'scales', 'corrplot'))


### Bioconductor packages 

> BiocManager::install(c('RUVSeq', 'DESeq2', 'GenomicFeatures'))





