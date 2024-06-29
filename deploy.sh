#!/usr/bin/env bash
# Update Virtual Machine
sudo apt -y update && sudo apt -y upgrade

# Install libraries and dependencies
sudo apt -y install rbenv tilde libffi-dev libyaml-dev nodejs npm

# Install a recent version of Ruby on Rails
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install 3.2.2
rbenv global 3.2.2
gem update --system
gem install rails

# Bundle install
bundle install

# Migrate changes to database
rails db:migrate

# Start the server
sudo /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 80