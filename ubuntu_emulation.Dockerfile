FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    man-db
# have to run unminimize
