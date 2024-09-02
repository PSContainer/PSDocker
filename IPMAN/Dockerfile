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

# is in the original
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common apt-transport-https ca-certificates && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y gcc-9 g++-9 zip unzip && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 99 --slave /usr/bin/g++ g++ /usr/bin/g++-9 && \
    update-alternatives --set gcc /usr/bin/gcc-9 && \
    apt-get clean && \
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


###################
# not in the original
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 && \
    apt-get -y install libx11-6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install build-essential -y
RUN apt-get update && apt-get -y install libstdc++6 && apt-get install freeglut3-dev -y
