#!/bin/bash

# Update conda and create a new conda environment named 'teach' with Python 3.9
conda create -n teach python=3.9 -y

# Activate the conda environment
echo "conda activate teach" >> ~/.bashrc

# Create a pip virtual environment in /opt/
mkdir -p /opt/teach-env
/opt/conda/envs/teach/bin/python -m venv /opt/teach-env

# Set environment variables
export PATH="/opt/teach-env/bin:$PATH"

# Activate the pip virtual environment and install packages
source /opt/teach-env/bin/activate
pip install --upgrade pip==23.0.1
pip install numpy==1.23.1 cython
pip install torch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0
pip install transformers==4.44.2 huggingface-hub==0.23.3 safetensors==0.4.1 regex==2020.6.8 tokenizers==0.19.1
pip install pytorch-lightning==1.5.0 lightning-utilities==0.11.7 packaging==24.1 fsspec==2024.9.0 torchmetrics==1.4.1 tqdm==4.66.5 --no-deps
pip install PyYAML==6.0.2

pip install hydra-core==1.3.2 shortuuid==1.0.13 colorlog==6.8.2
pip install pytorch-lightning==1.7.0
pip install tensorboard==2.18.0 future==1.0.0 pyDeprecate==0.3.1
pip install wandb==0.18.5 joblib==1.4.2
pip install pandas==2.2.3
pip install opencv-python==4.10.0.84
pip install moviepy==1.0.3
pip install smplx==0.1.28  einops==0.8.0 more_itertools==10.5.0 trimesh==4.5.0 pyrender==0.1.45 torchmetrics==0.7.2