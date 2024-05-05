# Use Miniforge3 as the base image
FROM condaforge/miniforge3:23.11.0-0

# Update Conda and install GCC and G++ using Conda

SHELL ["/bin/bash","-l", "-c"]


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
#    apt-get install python3.9 && \
#    apt-get install python3-pip && \
    apt-get -y install gcc mono-mcs && \
    rm -rf /var/lib/apt/lists/*
# compile python from source - avoid unsupported library problems
ENV DEBIAN_FRONTEND noninteractive
#RUN apt-get update -y && apt-get upgrade -y && \
#    apt-get install -y wget build-essential checkinstall  && \
#    apt-get install libreadline-gplv2-dev  libncursesw5-dev && \
#    apt-get install libssl-dev  libsqlite3-dev tk-dev && \
#    apt-get install libgdbm-dev libc6-dev && \
#    apt-get install libbz2-dev libffi-dev && \
#    apt-get install zlib1g-dev && \
#    cd /usr/src && \
#    wget https://www.python.org/ftp/python/3.9.18/Python-3.9.18.tgz && \
#    tar xzf Python-3.9.18.tgz && \
#    cd Python-3.9.18 && \
#    ./configure --enable-optimizations && \
#     make altinstall


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install g++ && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install python-dev && \
    rm -rf /var/lib/apt/lists/*
  #  apt-get install -y nvidia-container-toolkit && \

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get -y autoremove && \
    apt-get install zip unzip && \
    apt-get -y install python-dev && \
    rm -rf /var/lib/apt/lists/*


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 && \
    apt-get install libx11-6 && \
  #   apt-get install build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install build-essential -y
RUN apt-get update && apt-get install libstdc++6 && apt-get install freeglut3-dev -y
