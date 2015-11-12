FROM ubuntu:14.04

MAINTAINER Cao Jianhua

ENV NVM_VERSION v0.16.0
ENV NODEJS_VERSION v5.0.0

RUN apt-get update -y

# Install nvm
RUN apt-get install -y curl build-essential libssl-dev man && \
    curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | sh

# Install node.js
RUN bash -ic "nvm install $NODEJS_VERSION" && \
    bash -ic "nvm alias default $NODEJS_VERSION" && \
    bash -ic "nvm use $NODEJS_VERSION"

# Use Taobao node mirror and npm registry
ENV NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
RUN /root/.nvm/$NVM_VERSION/bin/npm config set registry http://registry.npm.taobao.org

# Install Nginx
RUN apt-get install nginx

CMD nginx start
