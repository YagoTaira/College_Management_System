#!/usr/bin/env bash
# Look for updates of available software packages && install libraries
sudo apt update && sudo apt install rbenv tilde libffi-dev libyaml-dev nodejs npm
# Bundle install
sudo chown ubuntu:ubuntu /home/ubuntu/College_Management_System/Gemfile.lock
sudo chmod 664 /home/ubuntu/College_Management_System/Gemfile.lock
bundle install
# Start the server
sudo /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 80
# Migrate changes to database
rails db:migrate
