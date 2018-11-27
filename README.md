# CapVote README

[![Build Status](https://travis-ci.org/ChangedNameTo/JD8112.svg?branch=master)](https://travis-ci.org/ChangedNameTo/JD8112)

#####Installation Instructions
First note that CapVote is meant to run on Linux and these instructions assume a Linux environment.

CapVote is a Ruby on Rails web application backed by a PostgresQL database. Therefore, to get CapVote up and running, we must first install Ruby, Rails, PostgreSQL, and various small packages.

* First install Ruby using rvm--Ruby Version Manager--by performing these two commands:

	`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

	`\curl -sSL https://get.rvm.io | bash -s stable --rails --ruby=2.3.1`

	Note: you have to use ruby 2.3.1. **Without this you will have compatibility issues with gems (Ruby packages)**

* Install PostgreSQL

	Postgres is the db backing for the project, fairly light and easy to use.

	Follow the instructions here: https://wiki.postgresql.org/wiki/Detailed_installation_guides

	Be sure to install the libraries and headers in the package `postgresql-server-dev-10`

	Important: Once installed, create a Postgres user with `'sudo -u postgres createuser -s your_user_name`

* Verify rails is installed with the comand

	`rails --version`

	If this doesn't work perform `gem install rails`

* Clone the project by downloading the repository's zip file or by performing

	`git clone https://github.com/ChangedNameTo/JD8112.git`

* Install Bundler with `gem install bundler`

	Bundler is a tool that bulk installs ruby gems. 

	* Build gems with Bundler with `bundle install`

* Create the database with `rails db:create`

* Migrate the database with `rails db:migrate`

* Start the server with `rails s`

Capvote is now up and running!

---

If you have any questions contact Will Mitchell at william.m95@gmail.com

#### Tools used

https://semantic-ui.com/
https://rvm.io/

#### Release Notes