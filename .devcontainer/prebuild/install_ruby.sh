#!/bin/bash

source /usr/share/rvm/scripts/rvm

rvm requirements
rvm install $RUBY_VERSION
rvm rvmrc warning ignore /opt/qai/Gemfile
gem install bundler -v "${BUNDLER_VERSION}"
bundle install
