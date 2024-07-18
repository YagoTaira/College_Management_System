# College Management System

This is a College Management System implemented using Ruby on Rails. The application allows users to manage students, lecturers, courses, enrollments, grades, and attendances.

## Features

- CRUD operations for Students, Lecturers, Courses, Enrollments, Grades, and Attendances.
- User interface with partials and layouts.
- Test-driven development with RSpec and Capybara.
- Continuous Integration and Deployment with CircleCI and AWS EC2.
- Various validations and associations between models.
- Responsive design with CSS.

## Models

- `Student`: Manages student records.
- `Lecturer`: Manages lecturer records.
- `Course`: Manages course records.
- `Enrollment`: Manages the relationship between students and courses.
- `Grade`: Manages grades assigned to students for courses.
- `Attendance`: Manages attendance records for enrollments.

## Setup

### Prerequisites

- Ruby 3.3.1
- Rails 7.x
- Node.js
- Yarn
- PostgreSQL

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/YagoTaira/College_Management_System.git
    cd College_Management_System
    ```

2. Install dependencies:
    ```bash
    bundle install
    yarn install
    ```

3. Set up the database:
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. Start the Rails server:
    ```bash
    rails server
    ```

### Running Tests

1. Install Chrome and ChromeDriver (if not already installed):
    ```bash
    sudo apt-get update
    sudo apt-get install -y wget libgconf-2-4 libatk1.0-0 libatk-bridge2.0-0 libgdk-pixbuf2.0-0 libgtk-3-0 libgbm-dev libnss3-dev libxss-dev fonts-liberation libatspi2.0-0 libcups2 libnspr4 libu2f-udev libvulkan1 libxcomposite1 libxdamage1 xdg-utils
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt-get install -f -y
    CHROMEDRIVER_VERSION="126.0.6478.126"
    wget "https://storage.googleapis.com/chrome-for-testing-public/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip"
    unzip chromedriver-linux64.zip
    sudo mv chromedriver-linux64/chromedriver /usr/bin/
    sudo chmod +x /usr/bin/chromedriver
    ```

2. Run tests:
    ```bash
    bundle exec rspec
    ```

## Continuous Integration and Deployment

This project uses CircleCI for continuous integration and deployment.

### CircleCI Configuration

The `config.yml` file for CircleCI:
```yaml
version: 2.1

workflows:
  build_test_deploy:
    jobs:
      - build
      - test:
          requires:
            - build
      - deploy:
          requires:
            - test
          filters:
            branches:
              only: main

jobs:
  build:
    working_directory: ~/College_Management_System
    docker:
      - image: cimg/ruby:3.3.1-node
    steps:
      - checkout
      - run:
          name: Install Dependencies
          command: |
            bundle install
            yarn install

  test:
    working_directory: ~/College_Management_System
    docker:
      - image: cimg/ruby:3.3.1-browsers
    steps:
      - checkout
      - run:
          name: Install Chrome and ChromeDriver
          command: |
            sudo apt-get update
            sudo apt-get install -y wget libgconf-2-4 libatk1.0-0 libatk-bridge2.0-0 libgdk-pixbuf2.0-0 libgtk-3-0 libgbm-dev libnss3-dev libxss-dev fonts-liberation libatspi2.0-0 libcups2 libnspr4 libu2f-udev libvulkan1 libxcomposite1 libxdamage1 xdg-utils
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo dpkg -i google-chrome-stable_current_amd64.deb
            sudo apt-get install -f -y
            google-chrome --version
            CHROMEDRIVER_VERSION="126.0.6478.126"
            wget "https://storage.googleapis.com/chrome-for-testing-public/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip"
            unzip chromedriver-linux64.zip
            sudo mv chromedriver-linux64/chromedriver /usr/bin/
            sudo chmod +x /usr/bin/chromedriver
            chromedriver --version
      - run:
          name: Install Dependencies
          command: |
            bundle install
            yarn install
      - run:
          name: Run tests
          command: bundle exec rspec

  deploy:
    docker:
      - image: cimg/ruby:3.3.1-node
    steps:
      - checkout
      - run:
          name: Deploy Application
          command: |
            ssh -o StrictHostKeyChecking=no $EC2_USERNAME@$EC2_PUBLIC_DNS "
            sudo rm -rf College_Management_System/;
            sudo git clone https://github.com/YagoTaira/College_Management_System.git;
            cd College_Management_System;
            sudo dos2unix deploy.sh;
            source deploy.sh;
            "