#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

v = vignette(topic="workflow_hca_loom", package = "workflow")
path = file.path(v$Dir, "doc", "workflow.Rmd")
rmarkdown::render(path, output_dir = "/output", params = list(knitr_eval=as.logical(args[1]), fileId=args[2], sample=args[3]))
