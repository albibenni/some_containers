FROM ubuntu:22.04

RUN apt update && \
    apt install -y \
    man-db \
    info \
    file \
    build-essential \
    vim \
    bc \ # for float arithmetic
    git
# have to run unminimize
