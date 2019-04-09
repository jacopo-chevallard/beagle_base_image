# Start from Alpine Linux, which is smaller than a full Ubuntu image
FROM ubuntu:18.04 

# Add/update required dependencies
RUN apt-get update && \
  apt-get install --no-install-recommends wget -y && \
  wget --no-check-certificate https://github.com/iterative/dvc/releases/download/0.35.4/dvc_0.35.4_amd64.deb && \
  dpkg -i dvc_0.35.4_amd64.deb && \
  apt-get update && \
  apt-get install cmake -y && \
  apt-get install  git bash -y && \
  apt-get install gcc-8 g++-8 gfortran-8 -y && \
  apt-get install --no-install-recommends python2.7 python-pip  python-wheel  python-setuptools -y && \
  apt-get install --no-install-recommends libopenmpi-dev openmpi-bin -y && \
  apt-get install --no-install-recommends libcfitsio-dev -y && \
  apt-get install --no-install-recommends liblapack-dev libfftw3-dev libfftw3-doc -y && \
  pip install fypp

# Set environment variables
ENV CC=gcc-8 \
  CXX=g++-8  \
  FC=gfortran-8
