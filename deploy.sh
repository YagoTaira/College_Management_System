#!/usr/bin/env bash
# Look for updates of available software packages && install libraries
sudo apt update && sudo apt install rbenv tilde libffi-dev libyaml-dev nodejs npm
# Install bundler
sudo gem install bundler
# Install rails
sudo gem install rails
# Bundle install
bundle install
# Migrate changes to database
sudo chown -R ubuntu:ubuntu /home/ubuntu/College_Management_System
rails db:migrate
# Start the server
sudo /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 80
