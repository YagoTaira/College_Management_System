#!/bin/bash

# Update package lists and install necessary packages
sudo apt update && sudo apt install -y tilde libffi-dev libyaml-dev nodejs npm ruby-dev

# Check the current Ruby version
which ruby
ruby -v

# Install rbenv if not installed
if [ ! -d "$HOME/.rbenv" ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# Add rbenv to the shell configuration in .bashrc if not already added
if ! grep -q 'rbenv init' ~/.bashrc; then
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc
fi

# Apply the changes in the current shell
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"

# Check the current Ruby version
which ruby

# Update rbenv and install specific Ruby version if not installed
rbenv install -s 3.3.1
rbenv global 3.3.1

# Check the current Ruby version
ruby -v

# Install Bundler and Rails gems
gem install bundler rails

# Install project dependencies
bundle install

# Change ownership of the project directory to the 'ubuntu' user
sudo chown -R ubuntu:ubuntu /home/ubuntu/College_Management_System

# Run database migrations
rails db:migrate

# Start the Rails server on port 80 in the background
sudo nohup /home/ubuntu/.rbenv/shims/rails server --binding 0.0.0.0 --port 80 &

# Wait for the server to start
sleep 10

# Print the running server processes
ps aux | grep rails