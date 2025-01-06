#!/bin/bash
# setup.sh

# Activate virtual environment
source /opt/skel_venv/bin/activate

# Upgrade pip
pip install -U pip

# Install PyTorch ecosystem
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113



# Core ML and scientific packages
pip install numpy==1.23.1 scipy==1.10.1 cython

# Image processing
pip install opencv-contrib-python-headless==4.5.1.48 \
    scikit-image==0.21.0 scikit-video==1.1.11 Pillow==9.5.0

# Visualization and GUI
pip install matplotlib==3.7.5 PyQt5==5.15.4

# 3D processing and graphics
pip install moderngl==5.8.2 moderngl-window==2.4.2 \
    trimesh==3.9.15 pyglet==2.1rc1 glcontext==2.5.0 \
    pyrender==0.1.45

# ML frameworks and utilities
pip install pytorch-lightning==1.7.0 wandb==0.18.5 \
    tensorboard==2.18.0 torchmetrics==0.7.2

# Utilities and dependencies
pip install tqdm==4.67.0 omegaconf==2.1.1 smplx==0.1.28 roma==1.2.3 \
    einops==0.8.0 more_itertools==10.5.0 \
    pandas==2.2.3 joblib==1.4.2 \
    PyYAML==6.0.2 future==1.0.0 colorlog==6.8.2 \
    hydra-core==1.3.2 shortuuid==1.0.13

# Additional dependencies
pip install antlr4-python3-runtime==4.8 \
    sympy==1.13.3 networkx==3.1 multipledispatch==1.0.0 \
    usd-core==23.5 websockets==14.1

# Git repositories
pip install git+https://github.com/mattloper/chumpy
pip install git+https://github.com/MPI-IS/mesh.git

# Clean pip cache
pip cache purge
