Rcollectl Workflow
------------------

The vignette in this package follows single-cell analysis workflow
(workflow chapters of the “Orchestrating Single-Cell Analysis with
Bioconductor” book) to analyze loom file from HCA dataset and tracks
computing resources usage with R package `Rcollectl`.

Suggested computing resources: 60 GB memory, 10 CPU cores when parameter
knitr\_eval set to TRUE to knit the vignette. FileId is the file id of
loom file to analyze. Sample should be one of column names from
manifest\_tibble, for example:
donor\_organism.biomaterial\_core.biomaterial\_id,
cell\_suspension.biomaterial\_core.biomaterial\_id, etc.

Build docker image with files in inst/docker:

    docker build -t bioconductor_docker_workflow_hca_loom:devel .

Knit vignette with built docker image and generate output at
LOCAL\_DIRECTORY:

    docker run -it -v LOCAL_DIRECTORY:/output --rm \
        --env knitr_eval=TRUE \
        --env fileId="902ac276-d7bf-5ae2-b89d-f80096a0b310" \
        --env sample="donor_organism.biomaterial_core.biomaterial_id" \
        --env core=10 \
        --env mem_gb=60 \
        bioconductor_docker_workflow_hca_loom:devel
