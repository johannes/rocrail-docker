ARG UBUNTU_MAJOR=18
ARG UBUNTU_MINOR=04
FROM ubuntu:${UBUNTU_MAJOR}.${UBUNTU_MINOR}
RUN apt-get update && apt-get install wget unzip -y
RUN apt-get install libwxgtk-media3.0-0v5 libusb-1.0-0 -y
ENV UBUNTU_MAJOR=18
ENV UBUNTU_MINOR=04
ENV ROCRAIL_VERSION=772
ENV ROCRAIL_ZIP=/tmp/rocrail.zip
ENV ROCRAIL_BASE=/opt/rocrail
ENV ROCRAIL_URL https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-${ROCRAIL_VERSION}-Ubuntu${UBUNTU_MAJOR}${UBUNTU_MINOR}-AMD64.zip
#ENV ROCRAIL_URL https://launchpad.net/rocrail/trunk/2.1/+download/rocrail-${ROCRAIL_VERSION}-ubuntu${UBUNTU_MAJOR}${UBUNTU_MINOR}-amd64.deb
# "https://launchpad.net/rocrail/trunk/2.1/+download/rocrail-${ROCRAIL_VERSION}-ubuntu${UBUNTU_MAJOR}${UBUNTU_MINOR}-amd64.deb"
# https://launchpad.net/rocrail/trunk/2.1/+download/rocrail-765-ubuntu2004-amd64.deb
# https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-621-Ubuntu1804-AMD64.zip
# https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-765-Ubuntu2004-AMD64.zip
RUN wget -O ${ROCRAIL_ZIP} ${ROCRAIL_URL}
RUN mkdir -pv ${ROCRAIL_BASE} && cd ${ROCRAIL_BASE} &&  unzip ${ROCRAIL_ZIP}

COPY entrypoint.sh /

RUN mkdir -pv /rocrail
WORKDIR /rocrail
VOLUME /rocrail

ENTRYPOINT /entrypoint.sh
