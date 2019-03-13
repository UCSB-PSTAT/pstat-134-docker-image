FROM jupyter/scipy-notebook:latest

LABEL maintainer="Sang-Yun Oh <syoh@ucsb.edu>"

RUN conda update -n base conda && \
    conda install -y -c cvxgrp cvxpy cvxportfolio && \
    conda update -y numpy && \
    conda install -y quandl && \
    \
    conda install -y -c anaconda python-dateutil lxml && \
    conda install -y -c conda-forge requests-oauthlib && \
    pip install fitbit && \
    \
    pip install datascience okpy

RUN mkdir -p $(jupyter --data-dir)/nbextensions && \
    cd $(jupyter --data-dir)/nbextensions && \
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && \
    \
    pip install nbgitpuller && \
    jupyter serverextension enable --py nbgitpuller --sys-prefix
