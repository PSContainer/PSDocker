FROM nvidia/cuda:11.7.1-devel-ubuntu20.04


ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# in the original
RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        git \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 \
        mercurial \
        openssh-client \
        procps \
        subversion \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH /opt/conda/bin:$PATH

CMD [ "/bin/bash" ]

# Leave these args here to better use the Docker build cache
ARG CONDA_VERSION=py311_24.1.2-0

RUN set -x && \
    UNAME_M="$(uname -m)" && \
    if [ "${UNAME_M}" = "x86_64" ]; then \
        MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh"; \
        SHA256SUM="3f2e5498e550a6437f15d9cc8020d52742d0ba70976ee8fce4f0daefa3992d2e"; \
    elif [ "${UNAME_M}" = "s390x" ]; then \
        MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-s390x.sh"; \
        SHA256SUM="0489909051fd9e2c9addfa5fbd531ccb7f8f2463ac47376b8854e5a09b1c4011"; \
    elif [ "${UNAME_M}" = "aarch64" ]; then \
        MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-aarch64.sh"; \
        SHA256SUM="1e046ef2d9d47289db2491f103c81b0b4baf943a9234ac59bd5bca076c881d98"; \
    fi && \
    wget "${MINICONDA_URL}" -O miniconda.sh -q && \
    echo "${SHA256SUM} miniconda.sh" > shasum && \
    if [ "${CONDA_VERSION}" != "latest" ]; then sha256sum --check --status shasum; fi && \
    mkdir -p /opt && \
    bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh shasum && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update &&  \ 
    apt-get install -y g++-7 gcc-7 &&  \   
    apt-get install --yes software-properties-common && \    
    apt-get install apt-transport-https ca-certificates -y &&   \  
    apt-get clean &&   \  
    apt-get install -y zip unzip && \    
    rm -rf /var/lib/apt/lists/* 
    # buildkit

# in the original
RUN apt-get update && apt-get install -y \
    libglu1-mesa-dev \
    freeglut3-dev \
    mesa-common-dev && \
    rm -rf /var/lib/apt/lists/*
# in the original
RUN apt-get update && apt-get install -y xvfb 

# Setting noninteractive environment to suppress UI-related prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Running multiple apt-get commands in a single RUN to minimize layers, improve cache utilization, and reduce image size
RUN apt-get update && \
    apt-get install -y \
    nano \
    vim \
    ffmpeg \
    libsm6 \
    libxext6 \
    libx11-6 \
    build-essential \
    libstdc++6 \
    freeglut3-dev \
    nvidia-utils-515 \
    libnvidia-gl-515-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



