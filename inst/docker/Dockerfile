# Docker inheritance
FROM bioconductor/bioconductor_docker:devel
ENV knitr_eval FALSE
ENV fileId "902ac276-d7bf-5ae2-b89d-f80096a0b310"
ENV sample "donor_organism.biomaterial_core.biomaterial_id"
ENV core 10
ENV mem_gb 60

# download and install collectl
RUN wget "https://sourceforge.net/projects/collectl/files/latest/download" \
	&& tar -xvzf download \
	&& cd collectl-* \
	&& ./INSTALL \
	&& cd .. \
	&& rm -rf download \
	&& rm -rf collectl-* 

# install Rcollectl with the vignette
COPY install_Rcollectl.R /tmp/install_Rcollectl.R
COPY run_Rcollectl.R /tmp/run_Rcollectl.R

RUN chmod +x /tmp/install_Rcollectl.R
RUN chmod +x /tmp/run_Rcollectl.R

RUN /tmp/install_Rcollectl.R

WORKDIR /output

CMD /tmp/run_Rcollectl.R $knitr_eval $fileId $sample $core $mem_gb
