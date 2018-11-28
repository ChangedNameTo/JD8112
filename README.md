# CapVote Installation Instructions and Release Notes

[![Build Status](https://travis-ci.org/ChangedNameTo/JD8112.svg?branch=master)](https://travis-ci.org/ChangedNameTo/JD8112)

#### I. Installation Instructions
First note that CapVote is meant to run on Linux and these instructions assume a Linux environment.

CapVote is a Ruby on Rails web application backed by a PostgresQL database. Therefore, to get CapVote up and running, we must first install Ruby, Rails, PostgreSQL, and various small packages.

* First install Ruby using rvm--Ruby Version Manager--by performing these two commands:

	`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

	`\curl -sSL https://get.rvm.io | bash -s stable --rails --ruby=2.3.1`

	Note: you have to use ruby 2.3.1. **Without this you will have compatibility issues with gems (Ruby packages).**

* Install PostgreSQL.

	Postgres is the database backing for the project; it is fairly light and easy to use.

	Follow the instructions here: https://wiki.postgresql.org/wiki/Detailed_installation_guides

	Be sure to install the libraries and headers in the package `postgresql-server-dev-10`

	Important: once installed, create a Postgres user with `'sudo -u postgres createuser -s your_user_name`

* Verify Rails is installed with the command

	`rails --version`

	If this doesn't work perform `gem install rails` to install Rails manually.

* Clone the project by downloading and extracting the repository's zip file or by performing

	`git clone https://github.com/ChangedNameTo/JD8112.git`

* Install Bundler with `gem install bundler`

	Bundler is a tool that bulk-installs Ruby gems. 

	* Build gems with Bundler with `bundle install`

* Create the database with `rails db:create`

* Migrate the database with `rails db:migrate`

* Seed the database with default values with `rails db:seed`

* Start the server with `rails s`

Capvote is now up and running!

* Installation troubleshooting
	
	* Ensure that Ruby 2.3.1 is installed. This is crucial.
	* Ensure that packages are to up date by running `bundle install`.
	* Ensure that a Postgres user has been created corresponding to your current Linux username.
	* Ensure that the Postgres libraries and headers found in the package `postgresql-server-dev-10` have been installed. 
	* Ensure that the database has been created, migrated, and seeded as outlined above.

---

If you have any questions contact Will Mitchell at william.m95@gmail.com

#### II. Release Notes

* Version 1.0
	* New Features in this release.
		*  Voting and leaving comments on projects is now fully functional.
		* Visitors can now view a map of the expo.
		* Administrators can enable/disable voting.
		* Administrators can create/delete projects.
		* Administrators can bulk-import projects.
		* Administrators can generate a PDF report of the expo voting.
		
	* Bug fixes since the last release.
		* None since this is the first official release.
		
	* Current bugs
		* Bug while viewing projects when no projects have been added.
		* Bug when a user tries to modify his/her comment.

#### III. Tools used

https://semantic-ui.com/
https://rvm.io/