Installation
============

Install PostgreSQL if you haven't already (see below)

1. `$ git clone git@github.com:dasgib/linkding.git`
2. `$ cd linkding`
3. `$ git flow init`
4. `$ bundle install`
5. `$ rake db:setup`
6. `$ rails server`

PostgreSQL-Installation
-----------------------

OSX
___

You need PostgreSQL:

	$ brew install postgresql
	$ curl http://nextmarvel.net/blog/downloads/fixBrewLionPostgres.sh | sh

Fix your $PATH (in ~/.zshrc or ~/.bash_profile or ~/.bashrc)

	export PATH=/usr/local/bin:$PATH

If you ran `bundle install` before fixing $PATH you need to reinstall pq gem:

	gem uninstall pg && gem install pg

Linux
_____

	$ apt-get install postgresql
	$ sudo -u postgres createuser `whoami`

Testing
-------

	$ rake db:setup
	$ rake
