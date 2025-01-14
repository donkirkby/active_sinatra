ARG UBUNTU_VERSION=22.04

FROM ubuntu:$UBUNTU_VERSION

ARG RUBY_VERSION=3.3.6
ARG BUNDLER_VERSION=2.5.23
ARG DEBIAN_FRONTEND=noninteractive

ENV IN_DOCKER=true \
    ORA_SDTZ=OS_TZ \
    NLS_LANG=AMERICAN_AMERICA.AL32UTF8 \
    APP_ENV=development

RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    apt-get -y install \
    nano \
    vim \
    wget \
    less \
    unzip \
    rlwrap \
    libaio-dev \
    tzdata \
    bash-completion \
    lsb-release \
    curl \
    gpg \
    &&\
    apt-get clean &&\
    apt-get autoremove -y

RUN apt-get -y install software-properties-common && \
    apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get -y update && \
    apt-get -y install rvm

# Copy the gem files and install before adding more files.
EXPOSE 4567
WORKDIR /opt/active_sinatra
COPY Gemfile* .
COPY .devcontainer/prebuild/install_ruby.sh /opt/active_sinatra/
RUN ./install_ruby.sh

# This will change with every build.
# COPY . .
# Symbolic link to this file, the command `irb` looks for `~/.irbrc`, which is
# not the same place where we mount our development code into.
RUN ln -s /opt/qai/.irbrc ~/.irbrc

ENTRYPOINT ["ruby", "/opt/active_sinatra/app.rb"]
