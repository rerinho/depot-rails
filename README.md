# depot-rails

This project was developed using the examples and exercises from the book **Agile Development With Rails 6**. It servers as  a practical application of the concepts and skills I've acquired from the book, focusing on web application development using Ruby on Rails.

## Table of Contents
- [About the Book](#about-the-book)
- [Project Overview](#project-overview)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)

## About the Book

**Agile Development With Rails 6** is the primary source and guide for this project. It provides a comprehensive approach to building web applications using Ruby on Rails, focusing on agile development practices. The book covers various aspects, including creating web apps, testing, and efficient deployment.

For more information about the book, please visit [the book's website](https://pragprog.com/titles/rails6agile-web-development-with-rails-6/).

## Project Overview

This project follows the examples and exercises presented in **Agile Development With Rails 6**. It includes the following components:

- Rails applications architecture
  - Models, Views and Controllers
  - Concerns
  - ApplicationCable
  - Scaffolding
  - Caching
  - AJAX
- Identification and handling errors when something goes wrong
- Ruby
  - Data Types
  - OOP
  - Logic
  - Block and iterators
- Model validation
- Unit, controller and integration testing
  - Fixtures
- Seeds and Migration


## Getting Started

To get started with this project, you can follow the exact steps outlined in the book. Here's a brief overview:

### Prerequisites

Before you begin, ensure you have the following prerequisites:

- Ruby (version 2.6.5)
- Ruby on Rails (version 6)

### Installation

1. Clone this repository to your local machine:
```bash
  git clone https://github.com/rerinho/depot-rails.git
```
2. Install the project dependencies:
```bash
  bundle install
  yarn install # For JS dependencies
```
### Usage

To start the application:
```bash
  rails server
```

To list available routes:
```bash
  rails routes
```

To run tests:
```bash
  rails test
```
