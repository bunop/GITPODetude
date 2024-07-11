
# VERSION 0.1.0
# DOCKER-VERSION  27.0.3
# AUTHOR:         Paolo Cozzi <paolo.cozzi@ibba.cnr.it>
# DESCRIPTION:    A docker images with mamba
# TO_BUILD:       docker build --rm -t bunop/gitpodetude .
# TO_RUN:         docker run --rm -ti bunop/gitpodetude bash
# TO_TAG:         docker tag bunop/gitpodetude:latest bunop/gitpodetude:0.1
#

FROM ubuntu:24.04

ARG MINIFORGE=Miniforge3-Linux-x86_64.sh

LABEL maintainer="paolo.cozzi@ibba.cnr.it"

# Install stuff
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        wget \
        curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/

# Install mamba
ENV CONDA_DIR="/opt/conda"

# get installer
ADD ["https://github.com/conda-forge/miniforge/releases/latest/download/${MINIFORGE}", "/root/${MINIFORGE}"]

# install stuff
RUN /bin/bash ~/${MINIFORGE} -b -p ${CONDA_DIR}

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH
