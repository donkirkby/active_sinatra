ARG UBUNTU_VERSION=22.04

FROM ubuntu:$UBUNTU_VERSION

ARG RUBY_VERSION=3.3.6
ARG BUNDLER_VERSION=2.5.23
ARG DEBIAN_FRONTEND=noninteractive

ENV IN_DOCKER=true \
    NLS_LANG=AMERICAN_AMERICA.AL32UTF8 \
    APP_ENV=development

RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    apt-get -y install software-properties-common && \
    apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get -y update &&\
    apt-get -y install \
    bash-completion \
    rvm \
    &&\
    apt-get clean &&\
    apt-get autoremove -y

# Copy the gem files and install before adding more files.
EXPOSE 4567
WORKDIR /opt/active_sinatra
COPY Gemfile* .
COPY .devcontainer/prebuild/install_ruby.sh /opt/active_sinatra/
RUN ./install_ruby.sh

# This will change with every build.
COPY . .

ENTRYPOINT ["./entry_point.sh"]
