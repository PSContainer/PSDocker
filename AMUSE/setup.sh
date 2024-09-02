#!/bin/bash

echo "Part 2: Amuse environment Setup"
eval "$(conda shell.bash hook)"


cd ../amuse

conda create -n amuse python=3.8
conda activate amuse
pip install PyYAML
conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
pip install smac wandb bvh pandas tqdm smplx pytube pydub einops pytorch3d 
pip install moviepy matplotlib IPython transforms3d peakutils librosa dtw seaborn
pip install torchmetrics wget timm==0.4.5 diffusers gdown
pip install textgrid lmdb pyarrow transformers pickle5 prettytable

export CUDA_HOME=/is/software/nvidia/cuda-11.3
conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
conda env update --file amuse.yml --prune
module load cuda/11.3
conda install anaconda::gxx_linux-64 # install 11.2.0
FORCE_CUDA=1 pip install --no-index --no-cache-dir pytorch3d -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/py38_cu113_pyt1110/download.html

cd ../amuse-container