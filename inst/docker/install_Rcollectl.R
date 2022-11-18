#! /usr/bin/env Rscript

# Install required packages
BiocManager::install(c("ggplot2", "dplyr", "pheatmap", "sessioninfo", "devtools", "GenomicFeatures", "tidyr", "hca", "matrixStats", "SingleCellExperiment", "LoomExperiment", "ensembldb", "EnsDb.Hsapiens.v86", "scater",  "BiocParallel", "scran", "batchelor", "BiocNeighbors", "uwot", "bluster", "celldex", "SingleR", "rmarkdown", "BiocStyle"))

# Install Rcollectl
BiocManager::install("vjcitn/Rcollectl")

# Install workflow vignette
BiocManager::install("yubocheng/Rcollectlworkflow", build_vignettes = TRUE)
