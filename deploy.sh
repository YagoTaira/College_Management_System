#!/usr/bin/env bash
# Look for updates of available software packages && install libraries
sudo apt update && sudo apt install rbenv tilde libffi-dev libyaml-dev nodejs npm
# Initiate rbenv
rbenv init
# Install Ruby 3.3.1 with rbenv
rbenv install 3.3.1
rbenv global 3.3.1
rbenv local 3.3.1
rbenv rehash
ruby -v
# Update gem system
sudo gem update --system
# Install bundler and rails
sudo gem install bundler rails
# Bundle install
bundle install
# Grant access to project directory
sudo chown -R ubuntu:ubuntu /home/ubuntu/College_Management_System
# Migrate changes to database
rails db:migrate
# Start the server
sudo /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 80
