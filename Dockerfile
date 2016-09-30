FROM ubuntu:15.10
MAINTAINER Laurent Gaches <laurent@binimo.com>

ENV SWIFT_SNAPSHOT swift-3.0-RELEASE
ENV SWIFT_SNAPSHOT_LOWERCASE swift-3.0-release
ENV UBUNTU_VERSION ubuntu15.10
ENV UBUNTU_VERSION_NO_DOTS ubuntu1510

ENV HOME /root
ENV WORK_DIR /root

VOLUME /Applications
EXPOSE 8090

# Set WORKDIR
WORKDIR ${WORK_DIR}

RUN apt-get update && apt-get install -y \
  automake \
  build-essential \
  clang \
  curl \
  gcc-4.8 \
  git \
  g++-4.8 \
  libbsd-dev \
  libglib2.0-dev \
  libpython2.7 \
  libicu-dev \
  libtool \
  lsb-core \
  openssh-client \
  vim \
  wget \
  libcurl4-openssl-dev \
  openssl \
  libssl-dev \
  uuid-dev
  
RUN wget https://swift.org/builds/$SWIFT_SNAPSHOT_LOWERCASE/$UBUNTU_VERSION_NO_DOTS/$SWIFT_SNAPSHOT/$SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && tar xzvf $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && rm $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz
ENV PATH $WORK_DIR/$SWIFT_SNAPSHOT-$UBUNTU_VERSION/usr/bin:$PATH

RUN swiftc -h
