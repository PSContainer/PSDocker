#!/bin/bash

# Update conda and create a new conda environment named 'sinc' with Python 3.10
conda create -n sinc python=3.10 -y

# Activate the conda environment
echo "conda activate sinc" >> ~/.bashrc

# Create a pip virtual environment in /opt/
mkdir -p /opt/sinc-env
/opt/conda/envs/sinc/bin/python -m venv /opt/sinc-env

# Set environment variables
export PATH="/opt/sinc-env/bin:$PATH"

# Activate the pip virtual environment and install packages
source /opt/sinc-env/bin/activate
pip install --upgrade pip==23.0.1

# pip install -r requirements.txt
pip install sympy==1.11.1 tensorboard==2.10.0 tensorboard-data-server==0.6.1 tensorboard-plugin-wit==1.8.1 termcolor==1.1.0 thinc==8.1.9 tokenizers==0.11.6 toml==0.10.2 tqdm==4.63.0 traitlets==5.1.1 transformers==4.17.0 trimesh==3.10.5 triton==2.0.0 typer==0.7.0 typing_extensions==4.1.1 urllib3==1.26.9 urwid==2.1.2 urwid-readline==0.13 GitPython==3.1.27 gdown uuid==1.30 wandb==0.12.11 wasabi==1.1.1 wcwidth==0.2.5 Werkzeug==2.0.3 yarl==1.7.2 yaspin==2.1.0 zipp==3.7.0 torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.1 torchmetrics==0.11.4 pytorch-lightning==2.0.1

pip install absl-py==1.0.0 aiohttp==3.8.1 aiosignal==1.2.0 antlr4-python3-runtime==4.9.3 asttokens==2.0.5 async-timeout==4.0.2 attrs==21.4.0 backcall==0.2.0 blis==0.7.9
pip install cachetools==5.0.0 catalogue==2.0.8 certifi==2021.10.8 charset-normalizer==2.0.12 chumpy==0.70 click==8.0.4 cmake==3.26.0
pip install colorlog==6.6.0 confection==0.0.4 cymem==2.0.7 decorator==4.4.2 docker-pycreds==0.4.0 einops==0.4.1
pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.5.0/en_core_web_sm-3.5.0-py3-none-any.whl
pip install executing==0.8.3 filelock==3.6.0 freetype-py==2.2.0 frozenlist==1.3.0 fsspec==2022.2.0 future==0.18.2 gitdb==4.0.9 google-auth==2.6.2 google-auth-oauthlib==0.4.6 grpcio==1.44.0 huggingface-hub==0.4.0 hydra-colorlog==1.2.0 hydra-core==1.3.2 idna==3.3 imageio==2.16.1 imageio-ffmpeg==0.4.5 importlib-metadata==4.11.3 ipdb==0.13.9 ipython==8.1.1 jedi==0.18.1 Jinja2==3.1.2 joblib==1.1.0 langcodes==3.3.0 lightning-utilities==0.8.0 lit==16.0.0 loguru==0.6.0 Markdown==3.3.6

pip install MarkupSafe==2.1.2 matplotlib-inline==0.1.3 more-itertools==9.1.0 moviepy==1.0.3 mpmath==1.3.0 multidict==6.0.2 murmurhash==1.0.9 networkx==2.7.1 numpy==1.22.3

pip install nvidia-cublas-cu11==11.10.3.66 nvidia-cuda-cupti-cu11==11.7.101 nvidia-cuda-nvrtc-cu11==11.7.99 nvidia-cuda-runtime-cu11==11.7.99 nvidia-cudnn-cu11==8.5.0.96 nvidia-cufft-cu11==10.9.0.58 nvidia-curand-cu11==10.2.10.91 nvidia-cusolver-cu11==11.4.0.1 nvidia-cusparse-cu11==11.7.4.91 nvidia-nccl-cu11==2.14.3 nvidia-nvtx-cu11==11.7.91

pip install oauthlib==3.2.0 omegaconf==2.3.0 opencv-python==4.5.5.64 packaging==21.3 pandas==1.4.1 parso==0.8.3 pathtools==0.1.2 pathy==0.10.1 pexpect==4.8.0 pickleshare==0.7.5

pip install Pillow==9.0.1 preshed==3.0.8 proglog==0.1.9 promise==2.3 prompt-toolkit==3.0.28 protobuf==3.19.4 psutil==5.9.0 ptyprocess==0.7.0 pudb==2022.1.1 pure-eval==0.2.2

pip install pyasn1==0.4.8 pyasn1-modules==0.2.8 pydantic==1.10.2 pyDeprecate==0.3.1 pyglet==1.5.23 Pygments==2.11.2 PyOpenGL==3.1.0 pyparsing==3.0.7 pyrender==0.1.45 python-dateutil==2.8.2

pip install pytz==2021.3 PyYAML==6.0 regex==2022.3.15 requests==2.27.1 requests-oauthlib==1.3.1 rsa==4.8 sacremoses==0.0.49 scipy==1.8.0 sentry-sdk==1.5.8 setproctitle==1.3.2

pip install shortuuid==1.0.8 six==1.16.0 smart-open==6.3.0 smmap==5.0.0 smplx==0.1.28

