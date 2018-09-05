# README

[![Build Status](https://travis-ci.org/ChangedNameTo/JD8112.svg?branch=master)](https://travis-ci.org/ChangedNameTo/JD8112)

For my junior design team, and any future deployers of code, here is the stuff you need to get started. Read the full readme before starting

* Install ruby using rvm

rvm is Ruby Version Manager, here to guide you through the waters of versioning.

`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

`\curl -sSL https://get.rvm.io | bash -s stable --rails --ruby=2.3.1`

You have to use ruby 2.3.1. **Without this you will have compatibility issues with gems**

* Install PostgreSQL

Postgres is the db backing for the project, fairly light and easy to use.

Follow the instructions here: https://wiki.postgresql.org/wiki/Detailed_installation_guides

* Verify rails is installed

`rails --version`

If this doesn't work do `gem install rails`

* Add LiveReload

LiveReload is a simple extension that reloads the browser window every time you make a change to the code. Makes changes much faster. Find it here: https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en

* Clone project

* Build gems

Bundler is a tool that bulk installs ruby gems. `bundle install`

* Start the server



Start the server with `rails s`

In another terminal start LiveReload with `bundle exec guard`

Click the LiveReload icon in browser to connect the refresher

* Start working!

---

If you have any questions contact me @ william.m95@gmail.com

# Tools used

https://semantic-ui.com/
https://rvm.io/
