#!/bin/bash

# Update conda and create a new conda environment named 'mfix' with Python 3.10
conda create -n mfix python=3.10 -y

# Activate the conda environment in the shell configuration
echo "conda activate mfix" >> ~/.bashrc

# Create a pip virtual environment in /opt/
mkdir -p /opt/mfix-env
/opt/conda/envs/mfix/bin/python -m venv /opt/mfix-env

# Set environment variables
export PATH="/opt/mfix-env/bin:$PATH"

# Activate the pip virtual environment
source /opt/mfix-env/bin/activate

# Upgrade pip and setuptools
pip install --upgrade pip setuptools

# Install core PyTorch packages
pip install "torch==2.0.1" "torchvision==0.15.2"
pip install "pytorch-lightning==2.2.4"

# Install all other requirements
pip install \
  absl-py==1.0.0 \
  accelerate==0.23.0 \
  aiohttp==3.8.1 \
  aiosignal==1.2.0 \
  aitviewer==1.12.0 \
  antlr4-python3-runtime==4.9.3 \
  appdirs==1.4.4 \
  asttokens==2.0.5 \
  async-timeout==4.0.2 \
  attrs==21.4.0 \
  backcall==0.2.0 \
  blis==0.7.9 \
  cachetools==5.0.0 \
  catalogue==2.0.8 \
  certifi==2021.10.8 \
  charset-normalizer==2.0.12 \
  click==8.0.4 \
  cmake==3.26.0 \
  colorlog==6.6.0 \
  confection==0.0.4 \
  contourpy==1.1.1 \
  cycler==0.12.1 \
  cymem==2.0.7 \
  decorator==4.4.2 \
  diffusers==0.21.2 \
  docker-pycreds==0.4.0 \
  einops==0.6.1 \
  "en-core-web-sm @ https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.5.0/en_core_web_sm-3.5.0-py3-none-any.whl#sha256=0964370218b7e1672a30ac50d72cdc6b16f7c867496f1d60925691188f4d2510" \
  executing==0.8.3 \
  filelock==3.6.0 \
  fonttools==4.43.1 \
  freetype-py==2.2.0 \
  frozenlist==1.3.0 \
  fsspec==2024.3.1 \
  future==0.18.2 \
  gitdb==4.0.9 \
  GitPython==3.1.27 \
  glcontext==2.4.0 \
  google-auth==2.6.2 \
  google-auth-oauthlib==0.4.6 \
  grpcio==1.44.0 \
  huggingface-hub==0.17.3 \
  hydra-colorlog==1.2.0 \
  hydra-core==1.3.2 \
  idna==3.3 \
  imageio==2.16.1 \
  imageio-ffmpeg==0.4.5 \
  imgui==2.0.0 \
  importlib-metadata==4.11.3 \
  ipdb==0.13.9 \
  ipython==8.1.1 \
  jedi==0.18.1 \
  Jinja2==3.1.2 \
  joblib==1.3.2 \
  kiwisolver==1.4.5 \
  langcodes==3.3.0 \
  lightning-utilities==0.8.0 \
  lit==16.0.0 \
  loguru==0.6.0 \
  Markdown==3.3.6 \
  markdown-it-py==3.0.0 \
  MarkupSafe==2.1.2 \
  matplotlib==3.8.0 \
  matplotlib-inline==0.1.3 \
  mdurl==0.1.2 \
  moderngl==5.8.2 \
  moderngl-window==2.4.4 \
  more-itertools==9.1.0 \
  moviepy==1.0.3 \
  mpmath==1.3.0 \
  multidict==6.0.2 \
  multipledispatch==1.0.0 \
  murmurhash==1.0.9 \
  networkx==2.7.1 \
  numpy==1.22.3 \
  oauthlib==3.2.0 \
  omegaconf==2.3.0 \
  opencv-contrib-python-headless==4.8.0.76 \
  opencv-python==4.5.5.64 \
  orjson==3.9.15 \
  packaging==21.3 \
  pandas==1.4.1 \
  parso==0.8.3 \
  pathtools==0.1.2 \
  pathy==0.10.1 \
  pexpect==4.8.0 \
  pickleshare==0.7.5 \
  Pillow==9.0.1 \
  preshed==3.0.8 \
  proglog==0.1.9 \
  promise==2.3 \
  prompt-toolkit==3.0.28 \
  protobuf==3.19.4 \
  psutil==5.9.0 \
  ptyprocess==0.7.0 \
  pudb==2022.1.1 \
  pure-eval==0.2.2 \
  pyasn1==0.4.8 \
  pyasn1-modules==0.2.8 \
  pydantic==1.10.2 \
  pyDeprecate==0.3.1 \
  pyglet==2.0.9 \
  Pygments==2.16.1 \
  PyOpenGL==3.1.0 \
  pyparsing==3.0.7 \
  PyQt5==5.15.9 \
  PyQt5-Qt5==5.15.2 \
  PyQt5-sip==12.12.2 \
  pyrender==0.1.45 \
  pyrr==0.10.3 \
  python-dateutil==2.8.2 \
  pytz==2021.3 \
  PyWavelets==1.4.1 \
  PyYAML==6.0 \
  regex==2022.3.15 \
  requests==2.27.1 \
  requests-oauthlib==1.3.1 \
  rich==13.5.3 \
  roma==1.4.0 \
  rsa==4.8 \
  sacremoses==0.0.49 \
  safetensors==0.3.3 \
  scikit-image==0.19.3 \
  scikit-video==1.1.11 \
  scipy==1.7.2 \
  sentry-sdk==1.5.8 \
  setproctitle==1.3.2 \
  shortuuid==1.0.8 \
  six==1.16.0 \
  smart-open==6.3.0 \
  smmap==5.0.0 \
  smplx==0.1.28 \
  spacy==3.5.1 \
  spacy-legacy==3.0.12 \
  spacy-loggers==1.0.4 \
  srsly==2.4.6 \
  stack-data==0.2.0 \
  sympy==1.11.1 \
  tensorboard==2.10.0 \
  tensorboard-data-server==0.6.1 \
  tensorboard-plugin-wit==1.8.1 \
  termcolor==1.1.0 \
  thinc==8.1.9 \
  tifffile==2023.9.18 \
  tokenizers==0.11.6 \
  toml==0.10.2 \
  tqdm==4.63.0 \
  traitlets==5.1.1 \
  transformers==4.17.0 \
  trimesh==3.10.5 \
  typer==0.7.0 \
  typing_extensions==4.11.0 \
  urllib3==1.26.9 \
  urwid==2.1.2 \
  urwid-readline==0.13 \
  usd-core==23.8 \
  uuid==1.30 \
  wandb==0.16.6 \
  wasabi==1.1.1 \
  wcwidth==0.2.5 \
  websockets==11.0.3 \
  Werkzeug==2.0.3 \
  yarl==1.7.2 \
  yaspin==2.1.0 \
  zipp==3.7.0

echo "Setup complete. Virtual environment 'mfix-env' is ready."