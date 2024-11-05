#!/bin/bash
set -e  # Exit on error

# Setup CUDA environment variables
export CUDA_HOME=/usr/local/cuda-11.6
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
export TCNN_CUDA_ARCHITECTURES="70;75;80"
export NVCC_PREPEND_FLAGS='-ccbin /usr/bin/gcc-9'

# Create and activate conda environment
eval "$(conda shell.bash hook)"
conda create -n flare python=3.9 -y
conda activate flare

# Install PyTorch with CUDA support
pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116

# Install conda packages
conda install -y -c fvcore -c iopath -c conda-forge fvcore iopath
conda install -y -c bottler nvidiacub
conda install -y https://anaconda.org/pytorch3d/pytorch3d/0.7.5/download/linux-64/pytorch3d-0.7.5-py39_cu116_pyt1131.tar.bz2

# Install basic dependencies
pip install ninja imageio PyOpenGL glfw xatlas gdown
pip install PyOpenGL PyOpenGL_accelerate

# Install git repositories
pip install git+https://github.com/NVlabs/nvdiffrast/
pip install --global-option="--no-networks" git+https://github.com/NVlabs/tiny-cuda-nn#subdirectory=bindings/torch
pip install git+https://github.com/jonbarron/robust_loss_pytorch

# Download additional binaries
imageio_download_bin freeimage

# Install remaining Python packages
pip install gpytoolbox opencv-python trimesh matplotlib chumpy lpips tqdm
pip install configargparse open3d shapely

# Install specific versions for compatibility
pip install imageio==2.19.5
pip install scikit-image==0.20.0
pip install numpy==1.22.4
pip install matplotlib==3.6.1
pip install trimesh==3.21.7
pip install numpy==1.23.1

# Make the conda environment activation persistent
echo "conda activate flare" >> ~/.bashrc
