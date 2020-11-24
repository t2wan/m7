# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

# scipy/machine learning (tensorflow)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
# ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2020.2-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

#RUN add-apt-repository -yu 'deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu xenial main'
RUN apt-get update
#RUN apt-get install gcc-4.9 g++-4.9 gcc-4.9-multilib
RUN apt-get install g++ -y
RUN DEBIAN_FRONTEND='noninteractive' apt-get install openjdk-8-jdk -y
RUN DEBIAN_FRONTEND='noninteractive' apt-get install curl -y
RUN DEBIAN_FRONTEND='noninteractive' apt-get install cmake -y 

# 3) install packages
RUN pip3 install --no-cache-dir numpy pandas requests

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]