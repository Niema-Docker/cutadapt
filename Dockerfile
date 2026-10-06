# Minimal Docker image for Cutadapt using Alpine base
FROM alpine:latest

# install Cutadapt
RUN apk update && \
    apk add --no-cache autoconf automake bash gcc libtool make musl-dev nasm py3-pip python3-dev yasm && \
    wget -qO- "https://github.com/intel/isa-l/archive/refs/tags/v2.32.1.tar.gz" | tar -zx && \
    cd isa-l-* && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    pip install --no-cache-dir 'cutadapt==5.2' && \
    rm -rf isa-l-*
