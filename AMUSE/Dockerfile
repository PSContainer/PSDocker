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
RUN apt-get update && apt-get install nvidia-utils-515 libnvidia-gl-515-server -y && \
 rm -rf /var/lib/apt/lists/*
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

# Set environment variables
ENV PATH /opt/conda/bin:$PATH

# Copy your script into the container
# COPY setup.sh /opt/setup_script.sh

# Make the script executable
# RUN chmod +x /opt/setup_script.sh

# Run the script during the image build process
# RUN /bin/bash -c "/opt/setup_script.sh"



# # Set up conda environment
# RUN conda create -n amuse python=3.8 -y
# SHELL ["conda", "run", "-n", "amuse", "/bin/bash", "-c"]

# # Install conda packages
# RUN conda install -y pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
# RUN conda install -y anaconda::gxx_linux-64

# # Install pip packages
# RUN pip install PyYAML smac wandb bvh pandas tqdm smplx pytube pydub einops pytorch3d
# RUN pip install moviepy matplotlib IPython transforms3d peakutils librosa dtw seaborn
# RUN pip install torchmetrics wget timm==0.4.5 diffusers gdown
# RUN pip install textgrid lmdb pyarrow transformers pickle5 prettytable

# # Install PyTorch3D
# RUN FORCE_CUDA=1 pip install --no-index --no-cache-dir pytorch3d -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/py38_cu113_pyt1110/download.html

# # Set working directory
# WORKDIR /amuse

# # Copy amuse.yml file
# COPY amuse.yml .

# # Update conda environment
# #RUN conda env update --file amuse.yml --prune -y

# # Activate conda environment by default
# RUN echo "conda activate amuse" >> ~/.bashrc

# # Set the default command to bash
# CMD ["/bin/bash"]

# # Default command to run when starting the container
# # CMD ["/bin/bash"]
