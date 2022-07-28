FROM ubuntu:22.04

#ARG INKSCAPE_VERSION=1.1
ARG DRAWIO_VERSION=19.0.3

# Install pdftops
RUN apt-get update && apt-get install -y \
    poppler-utils

# Install Inkscape 
#RUN apt-get update && apt-get install -y software-properties-common \
#    && add-apt-repository ppa:inkscape.dev/stable-${INKSCAPE_VERSION}
RUN apt-get update && apt-get install -y inkscape

## ALTERNATIVE 1: Install Draw.io with snap
# see: https://github.com/actions/virtual-environments/issues/3149
#RUN apt-get update && apt-get install -y snapd \
#    && snap install drawio


# ALTERNATIVE 2: Install Draw.io by hand
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
        libnotify4 \
        libxss1 \
        xdg-utils \
        libsecret-1-0 \
        libappindicator3-1 \
        libasound2 \
        libgbm1 \
        xvfb \
        wget
#RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v12.3.2/draw.io-amd64-12.3.2.deb
#RUN dpkg -i draw.io-*.deb
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v${DRAWIO_VERSION}/drawio-amd64-${DRAWIO_VERSION}.deb
RUN dpkg -i drawio-*.deb
RUN apt -y -f install

WORKDIR /app

COPY . /app

WORKDIR /data
ENTRYPOINT [ "/app/bin/convert-svg-files" ]
