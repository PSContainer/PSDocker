# Use Miniforge3 as the base image
FROM condaforge/miniforge3:23.11.0-0

# Update Conda and install GCC and G++ using Conda

SHELL ["/bin/bash","-l", "-c"]


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install g++ && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install python-dev && \
    rm -rf /var/lib/apt/lists/*

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
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install build-essential -y
RUN apt-get update && apt-get install libstdc++6 && apt-get install freeglut3-dev -y 

# modification for DECO
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install freeglut3-dev -y 


