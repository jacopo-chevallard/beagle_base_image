# Start from Alpine Linux, which is smaller than a full Ubuntu image
FROM phusion/baseimage

# Add/update required dependencies
RUN apt-get update && \
  add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
  apt-get update && \
  apt-get install cmake -y && \
  apt-get install git bash -y && \
  apt-get install gcc-6 g++-6 gfortran-6 -y && \
  apt-get install --no-install-recommends python2.7 python-pip  python-wheel  python-setuptools -y && \
  apt-get install --no-install-recommends libopenmpi-dev openmpi-bin -y && \
  apt-get install --no-install-recommends libcfitsio3-dev -y && \
  apt-get install --no-install-recommends liblapack-dev libfftw3-dev libfftw3-doc -y && \
  pip install fypp

# Set environment variables
ENV CC=gcc-6 \
  CXX=g++-6  \
  FC=gfortran-6
