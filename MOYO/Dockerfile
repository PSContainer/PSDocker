FROM nvidia/cuda:11.3.1-devel-ubuntu20.04


LABEL maintainer="Anaconda, Inc"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
# Set the environment variables
ENV TCNN_CUDA_ARCHITECTURES="70;75;80"
ENV NVCC_PREPEND_FLAGS='-ccbin /usr/bin/gcc-9'

# Set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Enable multi-arch support for i386 packages
RUN dpkg --add-architecture i386

# Install basic dependencies
RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        software-properties-common \
        apt-transport-https \
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
        g++ \
        gcc \
        zip \
        unzip \
        tzdata \
        linux-headers-generic \
        dkms \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

 # Morning 0726: Stitch Install OpenGL libraries
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    libgles2 \
    libglvnd-dev \
    cmake \
    curl \
    libgl1-mesa-dev \
    libegl1-mesa-dev \
    libgles2-mesa-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Modifications for PSBody -Mesh
RUN apt-get update && apt-get install -y \ 
    libeigen3-dev \ 
    libgmp-dev \ 
    libgmpxx4ldbl \ 
    libmpfr-dev \ 
    libboost-dev \ 
    libboost-thread-dev \ 
    build-essential \
    libcgal-dev \
    libtbb-dev \ 
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
   

    # CudSolver Sitch 
RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config \
   nvidia-cuda-dev \
    ninja-build \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
# Add NVIDIA driver PPA
RUN add-apt-repository ppa:graphics-drivers/ppa && \
    apt-get update

# Install NVIDIA drivers and libcusolver

RUN apt-get install -y --no-install-recommends \
        nvidia-driver-535 \
     libnvidia-gl-535 \
      nvidia-utils-535 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH /opt/conda/bin:$PATH

# Set environment variables for OpenGL
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility,graphics
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

# Set timezone
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
# 
# Set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install nano
RUN apt-get update && apt-get install -y nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*