FROM jupyter/minimal-notebook:2023-04-17

ARG USER=jovyan


# useful software
USER root
RUN apt-get update && \
    apt-get -y install \
        ca-certificates curl \
        git vim screen \
        build-essential g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $USER
RUN mamba install -y -c conda-forge \
    nodejs=18 \
    && \
    mamba clean -y --all

USER $USER
RUN pip install git+https://github.com/duytnguyendtn/jpyjs9.git@multi
