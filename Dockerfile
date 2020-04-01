FROM dddlab/python-notebook:v20200331-df7ed42-94fdd01b492f

LABEL maintainer="Patrick Windmiller <sysadmin@pstat.ucsb.edu>"

RUN pip install nbzip

USER root

RUN jupyter serverextension enable --py nbzip --sys-prefix && \
\    
    jupyter nbextension install --py nbzip && \
\
    jupyter nbextension enable --py nbzip
