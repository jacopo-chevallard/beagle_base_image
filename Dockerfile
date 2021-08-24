# Start from Alpine Linux, which is smaller than a full Ubuntu image
FROM ubuntu:20.04 

# Add/update required dependencies
RUN apt-get update && \
  apt-get install software-properties-common -y && \
  apt-get update && \
  add-apt-repository 'deb http://dk.archive.ubuntu.com/ubuntu/ bionic main universe' && \
  apt-get update && \
  apt-get install --no-install-recommends wget -y && \
  wget --no-check-certificate https://github.com/iterative/dvc/releases/download/0.35.4/dvc_0.35.4_amd64.deb && \
  dpkg -i dvc_0.35.4_amd64.deb && \
  apt-get update && \
  apt-get install cmake -y && \
  apt-get install git bash -y && \
  apt-get install gcc-6 g++-6 gfortran-6 -y && \
  apt-get install gcc-9 g++-9 gfortran-9 -y && \
  apt-get install --no-install-recommends python3 python3-pip  python3-wheel  python3-setuptools -y && \
  apt-get install --no-install-recommends libopenmpi-dev openmpi-bin -y && \
  apt-get install --no-install-recommends libcfitsio-dev -y && \
  apt-get install --no-install-recommends liblapack-dev libfftw3-dev libfftw3-doc -y && \
  pip3 install -Iv fypp==3.0 && \
  apt-get install --no-install-recommends gnupg sed curl cl-base64 openssl jq -y

# Set environment variables
ENV CC=gcc-6 \
  CXX=g++-6  \
  FC=gfortran-6
