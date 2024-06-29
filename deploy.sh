#!/usr/bin/env bash
# Update Virtual Machine
sudo apt -y update && sudo apt -y upgrade
# Install libraries and dependencies
sudo apt -y install rbenv tilde libffi-dev libyaml-dev nodejs npm
# Change directory into folder where application is downloaded
cd College_Management_System/
# Bundle install
bundle install
# Migrate changes to database
rails db:migrate
# Start the server
sudo /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 80