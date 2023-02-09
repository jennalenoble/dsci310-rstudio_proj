FROM rocker/rstudio 

RUN whoami
RUN pwd
RUN ls -alh
# RUN Rscript -e "install.packages('cowsay', repos='https://cran.us.r-project.org')"

WORKDIR /home/rstudio

RUN pwd

COPY --chown=rstudio:rstudio renv.lock .
COPY --chown=rstudio:rstudio renv renv
COPY --chown=rstudio:rstudio .Rprofile .

RUN ls -alh

USER rstudio
RUN Rscript -e "renv::repair"
USER root