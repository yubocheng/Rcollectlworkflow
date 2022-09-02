#!/usr/bin/env Rscript

# Install required packages
BiocManager::install(c("ggplot2", "lubridate", "dplyr", "pheatmap", "sessioninfo", "DT", "devtools", "GenomicFeatures", "tidyr", "hca", "matrixStats", "SummarizedExperiment", "SingleCellExperiment", "LoomExperiment", "ensembldb", "EnsDb.Hsapiens.v86", "scater", "BiocParallel", "scran", "batchelor", "BiocNeighbors", "uwot", "bluster", "celldex", "SingleR", "rmarkdown", "BiocStyle", "knitcitations"))

# Install Rcollectl
BiocManager::install("yubocheng/Rcollectl@cl_timestamp")

# Install workflow vignette
BiocManager::install("yubocheng/workflow", build_vignettes = TRUE)
