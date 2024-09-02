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

##################################
### Anaconda
CMD [ "/bin/bash" ]

RUN set -x && \
    UNAME_M="$(uname -m)" && \
    if [ "${UNAME_M}" = "x86_64" ]; then \
        MINIFORGE_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"; \
    elif [ "${UNAME_M}" = "s390x" ]; then \
        MINIFORGE_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-s390x.sh"; \
    elif [ "${UNAME_M}" = "aarch64" ]; then \
        MINIFORGE_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh"; \
    fi && \
    wget "${MINIFORGE_URL}" -O miniforge.sh -q && \
    mkdir -p /opt && \
    bash miniforge.sh -b -p /opt/conda && \
    rm miniforge.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy
##################################

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



