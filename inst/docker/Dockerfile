# Docker inheritance
FROM bioconductor/bioconductor_docker:devel
ENV knitr_eval FALSE
ENV fileId "902ac276-d7bf-5ae2-b89d-f80096a0b310"
ENV sample "donor_organism.biomaterial_core.biomaterial_id"

# download and install collectl
RUN wget "https://sourceforge.net/projects/collectl/files/latest/download" \
	&& tar -xvzf download \
	&& cd collectl-* \
	&& ./INSTALL \
	&& cd .. \
	&& apt-get clean \
	&& rm -rf download \
	&& rm -rf collectl-* 

# install Rcollectl with the vignette
COPY install_Rcollectl.R /tmp/install_Rcollectl.R
COPY run_Rcollectl.R /tmp/run_Rcollectl.R

RUN Rscript /tmp/install_Rcollectl.R
CMD Rscript /tmp/run_Rcollectl.R $knitr_eval $fileId $sample
