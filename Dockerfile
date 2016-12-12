FROM ubuntu:16.04
MAINTAINER Laurent Gaches <laurent@binimo.com>

ENV SWIFT_SNAPSHOT swift-3.0.1-RELEASE
ENV SWIFT_SNAPSHOT_LOWERCASE swift-3.0.1-release
ENV UBUNTU_VERSION ubuntu16.04
ENV UBUNTU_VERSION_NO_DOTS ubuntu1604

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV HOME /root
ENV WORK_DIR /root

VOLUME /Applications
EXPOSE 8090

# Standard SSH port
EXPOSE 22



# Set WORKDIR
WORKDIR ${WORK_DIR}

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y  build-essential clang-3.8 git libpython2.7 libicu-dev libxml2 wget libcurl4-openssl-dev vim openssl libssl-dev

# Set clang 3.8 as default
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 100


RUN wget https://swift.org/builds/$SWIFT_SNAPSHOT_LOWERCASE/$UBUNTU_VERSION_NO_DOTS/$SWIFT_SNAPSHOT/$SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && tar xzvf $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && rm $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz
ENV PATH $WORK_DIR/$SWIFT_SNAPSHOT-$UBUNTU_VERSION/usr/bin:$PATH

RUN swiftc -h
