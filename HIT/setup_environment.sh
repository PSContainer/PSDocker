#!/bin/bash

# Update conda and create a new conda environment named 'teach' with Python 3.9
conda create -n hit python=3.8 -y

# Activate the conda environment
echo "conda activate hit" >> ~/.bashrc

# Create a pip virtual environment in /opt/
mkdir -p /opt/hit_venv
/opt/conda/envs/hit/bin/python -m venv /opt/hit_venv

# Set environment variables
export PATH="/opt/teach-env/bin:$PATH"

# Activate the pip virtual environment and install packages
source /opt/hit_venv/bin/activate
pip install --upgrade pip==23.0.1

pip install  git+https://github.com/MPI-IS/mesh.git
pip install  git+https://github.com/mattloper/chumpy
pip install torch==2.2.0 torchvision==0.17.0 torchaudio==2.2.0 --index-url https://download.pytorch.org/whl/cu118
pip install absl-py==2.1.0 aiohappyeyeballs==2.4.4 aiohttp==3.10.11 aiosignal==1.3.1 annotated-types==0.7.0
pip install antlr4-python3-runtime==4.9.3 async-timeout==5.0.1 attrs==24.2.0 cachetools==5.5.0 certifi==2022.12.7
pip install charset-normalizer==2.1.1 click==8.1.7 contourpy==1.1.1 cycler==0.12.1 Cython==3.0.11 PyOpenGL==3.1.0 hydra-core==1.3.2
pip install dagrt==2021.1 datasets==3.1.0 dill==0.3.8 docker-pycreds==0.4.0 eval_type_backport==0.2.0
pip install exceptiongroup==1.2.2 filelock==3.13.1 fonttools==4.55.2 freetype-py==2.5.1 frozenlist==1.5.0
pip install pyrender==0.1.45 pytorch-lightning==1.9.0 omegaconf==2.3.0 scikit-image==0.21.0 matplotlib==3.7.5 wandb==0.17.1 PyOpenGL==3.1.0 pyglet==2.0.20
pip install pysdf==0.1.9 pytest==8.3.4 pluggy==1.5.0 iniconfig==2.0.0 exceptiongroup==1.2.2 tomli==2.2.1 trimesh==4.5.3 networkx==3.0
pip install aiohttp==3.10.11 requests==2.32.3 urllib3==1.26.13 yarl==1.15.2 multidict==6.1.0
pip install prettytable==3.11.0 wcwidth==0.2.13
pip install pydantic==2.10.3 pydantic-core==2.27.1 typing-extensions==4.12.2 annotated-types==0.7.0 attrs==24.2.0

pip install google-auth==2.36.0 google-auth-oauthlib==1.0.0 oauthlib==3.2.2 requests-oauthlib==2.0.0 rsa==4.9

pip install hydra-core==1.3.2 omegaconf==2.3.0 PyYAML==5.4.1 antlr4-python3-runtime==4.9.3 click==8.1.7
