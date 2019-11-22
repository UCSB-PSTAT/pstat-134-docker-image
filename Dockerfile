FROM ucsb/base-scipy:v191121

LABEL maintainer="Sang-Yun Oh <syoh@ucsb.edu>"

USER $NB_UID

RUN \
    pip install cvxpy nltk quandl && \
    \
    # Notebook extensions (TOC extension)
    pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --sys-prefix && \
    jupyter nbextension enable toc2/main --sys-prefix && \
    jupyter nbextension enable toggle_all_line_numbers/main --sys-prefix && \
    jupyter nbextension enable table_beautifier/main --sys-prefix && \
    \
    # Notebook extensions configurator (server on and interface off)
    jupyter nbextension install jupyter_nbextensions_configurator --py --sys-prefix && \
    jupyter nbextensions_configurator disable --sys-prefix && \
    jupyter serverextension enable jupyter_nbextensions_configurator --sys-prefix && \
    \
    # jupyter lab extensions
    jupyter labextension install @jupyterlab/toc --clean && \
    \
    # remove cache
    rm -rf ~/.cache/pip ~/.cache/matplotlib ~/.cache/yarn
