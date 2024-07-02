#!/bin/bash

# Update package lists and install necessary packages
sudo apt update && sudo apt install -y tilde libffi-dev libyaml-dev nodejs npm ruby-dev

# Check the current Ruby version
which ruby
ruby -v

# Update rbenv and install the specified Ruby version
git -C ~/.rbenv/plugins/ruby-build pull
rbenv global 3.3.1

# List available Ruby versions
rbenv install --list
ruby -v

# Install Bundler and Rails gems
gem install bundler rails

# Install project dependencies
bundle install

# Change ownership of the project directory to the 'ubuntu' user
sudo chown -R ubuntu:ubuntu /home/ubuntu/College_Management_System

# Run database migrations
rails db:migrate

# Start the Rails server on port 3000
sudo /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 3000