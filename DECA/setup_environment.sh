#!/bin/bash

# Update conda and create a new conda environment named 'sinc' with Python 3.10
conda create -n deca python=3.7 -y

# Activate the conda environment
echo "conda activate deca" >> ~/.bashrc

# Create a pip virtual environment in /opt/
mkdir -p /opt/deca-env
/opt/conda/envs/deca/bin/python -m venv /opt/deca-env

# Set environment variables
export PATH="/opt/deca-env/bin:$PATH"

# Activate the pip virtual environment and install packages
source /opt/deca-env/bin/activate
pip install --upgrade pip==23.0.1
pip install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0+cu113
pip install pytorch3d==0.3.0 kornia==0.5.10 face-alignment==1.2.0
pip install numpy==1.19.5 scipy==1.7.3 scikit-image==0.19.3
pip install chumpy==0.70 opencv-python==4.10.0.84 yacs==0.1.8 ninja==1.11.1.1 pytorch3d

# If you have additional dependencies in a requirements file
# pip install -r requirements.txt

echo "Virtual environment $ENV_NAME created and packages installed."
