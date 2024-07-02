#!/usr/bin/env bash
# Look for updates of available software packages && install libraries
sudo apt update && sudo apt install rbenv tilde libffi-dev libyaml-dev nodejs npm
# Install Ruby 3.3.1 with rbenv
rbenv install 3.3.1
rbenv global 3.3.1
# Install bundler
sudo gem install bundler
# Bundle install
bundle install
# Grant access to project directory
sudo chown -R ubuntu:ubuntu /home/ubuntu/College_Management_System
# Migrate changes to database
bundle exec rake rails:update:bin
bundle exec rails db:migrate
# Start the server
sudo /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 80
