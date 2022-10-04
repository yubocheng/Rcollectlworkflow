version 1.0

task Rcollectl_hca_loom {
    input {
        Boolean knitr_eval
        String fileId
        String sample
    }

    command {
        Rscript /tmp/run_Rcollectl.R ${knitr_eval} ${fileId} ${sample}
    }

    output {
        File workflow_hca_loom = "workflow_hca_loom.html"
    }

    runtime {
        docker: "ycheng2022/bioconductor_docker_workflow_hca_loom:devel"
    }
}

workflow RcollectlWorkflow {
    input {
        Boolean knitr_eval
        String fileId
        String sample
    }

    call Rcollectl_hca_loom {input: knitr_eval=knitr_eval, fileId=fileId, sample=sample}

    meta {
        author: "Yubo Cheng"
        email: "Yubo.Cheng@roswellpark.org"
        description: "Provide a single-cell analysis Workflow as well as computing resources usage tracking with package Rcollectl"
    }
}
