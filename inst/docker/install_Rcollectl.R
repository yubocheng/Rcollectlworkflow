#!/usr/bin/env Rscript

# Install required packages
BiocManager::install(c("ggplot2", "lubridate", "dplyr", "pheatmap", "sessioninfo", "DT", "devtools", "GenomicFeatures", "tidyr", "hca", "matrixStats", "SummarizedExperiment", "SingleCellExperiment", "rhdf5", "LoomExperiment", "ensembldb", "EnsDb.Hsapiens.v86", "scater",  "BiocParallel", "scran", "batchelor", "BiocNeighbors", "uwot", "bluster", "celldex", "SingleR", "rmarkdown", "BiocStyle", "knitcitations", "viridis"))

# Install Rcollectl
BiocManager::install("vjcitn/Rcollectl")

# Install workflow vignette
BiocManager::install("yubocheng/Rcollectlworkflow", build_vignettes = TRUE, force = TRUE)
