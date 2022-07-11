FROM ubuntu:focal

# Install Poppler 
RUN apt install poppler-utils
# Install Draw.io 
RUN apt update \
    && apt-get install -y libappindicator3-1 \
    && apt -y install wget
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v12.3.2/draw.io-amd64-12.3.2.deb
RUN dpkg -i draw.io-amd64-12.3.2.deb
RUN apt -y -f install
# see: https://github.com/actions/virtual-environments/issues/3149
#          snap install drawio
# Install Inkscape 
RUN add-apt-repository ppa:inkscape.dev/stable \
    && apt-get update \
    && apt install inkscape

WORKDIR /app

COPY . /app

WORKDIR /data
ENTRYPOINT [ "/app/bin/convert-svg-files" ]





