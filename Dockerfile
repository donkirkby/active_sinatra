ARG UBUNTU_VERSION=22.04

FROM ubuntu:$UBUNTU_VERSION

ARG RUBY_VERSION=3.3.6
ARG BUNDLER_VERSION=2.5.23
ARG DEBIAN_FRONTEND=noninteractive

ENV IN_DOCKER=true \
    LD_LIBRARY_PATH=/opt/oracle/instantclient_23_4 \
    PATH=/opt/oracle/instantclient_23_4:$PATH \
    ORACLE_HOME=/opt/oracle/instantclient_23_4 \
    ORA_SDTZ=OS_TZ \
    TNS_ADMIN=/opt/active_sinatra/config \
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
    unzip \
    libaio-dev \
    &&\
    apt-get clean &&\
    apt-get autoremove -y

COPY vendor /vendor
RUN unzip -n /vendor/instantclient-basic*   -d /opt/oracle &&\
    unzip -n /vendor/instantclient-sqlplus* -d /opt/oracle &&\
    unzip -n /vendor/instantclient-sdk* -d /opt/oracle &&\
    rm -rf /vendor

# Copy the gem files and install before adding more files.
EXPOSE 4567
WORKDIR /opt/active_sinatra
COPY Gemfile* .
COPY .devcontainer/prebuild/install_ruby.sh /opt/active_sinatra/
RUN ./install_ruby.sh

# This will change with every build.
COPY . .

ENTRYPOINT ["./entry_point.sh"]
