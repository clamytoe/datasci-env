FROM continuumio/miniconda3
LABEL maintainer="Martin Uribe"

RUN apt-get update && apt-get install -y libgtk2.0-dev && \
    rm -rf /var/lib/apt/lists/*

RUN /opt/conda/bin/conda update -n base -c defaults conda -y && \
    /opt/conda/bin/conda config --add channels conda-forge && \
    /opt/conda/bin/conda config --set channel_priority strict && \
    /opt/conda/bin/conda install python=3.9 -y && \
    /opt/conda/bin/conda install anaconda-client -y && \
    /opt/conda/bin/conda install jupyter statsmodels pandas scikit-learn scipy seaborn -y && \
    /opt/conda/bin/conda install black flake8 isort mypy rich pandoc pytest faker pip -y && \
    /opt/conda/bin/conda install pyyaml h5py keras tensorflow xgboost -y && \
    /opt/conda/bin/conda install pyppeteer imutils bs4 html5lib -y && \
    /opt/conda/bin/pip install parquet wget

RUN ["mkdir", "notebooks"]
COPY conf/.jupyter /root/.jupyter
COPY run_jupyter.sh /root/.

# Jupyter and Tensorboard ports
EXPOSE 8888 6006

# Store notebooks in this mounted directory
VOLUME /notebooks

CMD ["/root/run_jupyter.sh"]

