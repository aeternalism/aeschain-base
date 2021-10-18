FROM ubuntu:focal

RUN apt-get update && apt-get install build-essential curl -y

# Change to bash
SHELL ["/bin/bash", "-c"]

# Install go
RUN curl -sOJL https://golang.org/dl/go1.16.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz
ENV PATH="$PATH:/usr/local/go/bin"

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="$PATH:/root/.cargo/bin"
RUN rustup update stable && rustup target add wasm32-unknown-unknown

# Install starport
RUN curl https://get.starport.network/starport@v0.17.3! | bash
