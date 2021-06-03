# Minimal Docker image for Cutadapt v3.4 using Alpine base
FROM alpine:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install Cutadapt
RUN apk update && \
    apk add autoconf automake bash gcc libtool make musl-dev py3-pip python3-dev yasm && \
    wget -qO- "https://github.com/intel/isa-l/archive/refs/tags/v2.30.0.tar.gz" | tar -zx && \
    cd isa-l-* && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    pip install --no-cache-dir 'cutadapt==3.4' && \
    rm -rf isa-l-*
