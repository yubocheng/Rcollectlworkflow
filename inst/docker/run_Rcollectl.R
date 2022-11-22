#! /usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

v = vignette(topic="workflow_hca_loom", package = "Rcollectlworkflow")
path = file.path(v$Dir, "doc", "workflow_hca_loom.Rmd")
file.copy(from = path, to = getwd())
rmarkdown::render("workflow_hca_loom.Rmd", output_dir = ".", params = list(knitr_eval=as.logical(args[1]), fileId=args[2], sample=args[3], core=args[4], mem_gb=args[5]))
