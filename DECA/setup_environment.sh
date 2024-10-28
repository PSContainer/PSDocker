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
# Install packages with pip
pip install numpy==1.18.5 scipy==1.4.1 chumpy==0.69 scikit-image==0.15 opencv-python==4.1.1 PyYAML==5.1.1 torch==1.6.0 torchvision==0.7.0 face-alignment yacs==0.1.8 kornia==0.4.0 ninja fvcore
pip install torch==1.6.0 torchvision==0.7.0 pytorch3d

# If you have additional dependencies in a requirements file
# pip install -r requirements.txt

echo "Virtual environment $ENV_NAME created and packages installed."
