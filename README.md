Rcollectl Workflow
------------------

The vignette in this package follows single-cell analysis workflow
(workflow chapters of the “Orchestrating Single-Cell Analysis with
Bioconductor” book) to analyze loom file from HCA dataset and tracks
computing resources usage with R package `Rcollectl`.

Suggested computing resources: 60 GB memory, 16 CPUs when parameter
knitr\_eval set to TRUE to knit the vignette.

Build docker image with files in inst/docker:

    docker build -t bioconductor_docker_workflow_hca_loom:devel .

Knit vignette with built docker image and generate output at
LOCAL\_DIRECTORY:

    docker run -it -v LOCAL_DIRECTORY:/output --rm \
        --env knitr_eval=FALSE \
        --env fileId="1c0434e8-df9d-54f9-9534-74ae512b10de" \
        --env sample="cell_suspension.biomaterial_core.biomaterial_id" \
        bioconductor_docker_workflow_hca_loom:devel
