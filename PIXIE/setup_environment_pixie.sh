#!/bin/bash

# Update conda and create a new conda environment named 'teach' with Python 3.9
conda create -n pixie python=3.7 -y

# Activate the conda environment
echo "conda activate pixie" >> ~/.bashrc

# Create a pip virtual environment in /opt/
mkdir -p /opt/pixie-env
/opt/conda/envs/pixie/bin/python -m venv /opt/pixie-env

# Set environment variables
export PATH="/opt/pixie-env/bin:$PATH"

# Activate the pip virtual environment and install packages
source /opt/pixie-env/bin/activate
#pip install --upgrade pip==23.0.1
pip install numpy==1.23.1 cython
pip install scipy==1.5.3
pip install chumpy==0.69 scikit-image==0.17 opencv-python==4.1.1
pip install PyYAML==5.1.1
pip install torch==1.6.0 torchvision==0.7.0 face-alignment==1.1.0
pip install kornia==0.4.0
pip install yacs
pip install ninja
pip install cycler==0.11.0 fonttools==4.38.0 kiwisolver==1.4.5 matplotlib==3.5.3 pyparsing==3.1.4 python-dateutil==2.9.0.post0 six==1.16.0

