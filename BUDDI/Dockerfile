FROM nvidia/cuda:11.3.1-devel-ubuntu20.04


ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# is in the original
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
##################################

# is in the original
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y g++ gcc && \
    apt-get install --yes software-properties-common && \
    apt-get install apt-transport-https ca-certificates -y && \
    apt-get clean && \
    apt-get install -y zip unzip && \
    rm -rf /var/lib/apt/lists/*

    # is in the original
RUN apt-get update && apt-get install -y \
    libglu1-mesa-dev \
    freeglut3-dev \
    mesa-common-dev && \
    rm -rf /var/lib/apt/lists/*

    # is in the original
RUN apt-get update && apt-get install -y xvfb 

# is in the original
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install nano vim && \
    rm -rf /var/lib/apt/lists/*


# is in the original
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install nvidia-utils-515 libnvidia-gl-515-server -y && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 && \
    apt-get install -y  libxss1 libgl1-mesa-dev && \
     rm -rf /var/lib/apt/lists/* # buildkit

###################
# not in the original
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 && \
    apt-get install libx11-6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install build-essential -y
RUN apt-get update && apt-get install libstdc++6 && apt-get install freeglut3-dev -y
