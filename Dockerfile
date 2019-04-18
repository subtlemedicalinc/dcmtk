FROM ubuntu

RUN apt-get update && \
    apt-get install -y build-essential cmake uuid uuid-dev pkg-config