
# Hosting On Heroku

## Prepare Your App for Deployment to Heroku

### add a new group and gem to our Gemfile
	limingth@gmail ~/Github/myRoR/wikiful$ vi Gemfile
	 35 
	 36 group :production do
	 37   gem 'rails_12factor'
	 38 end
	 39 


## Work through the "Getting Started With Heroku" Guide

### do as told

* https://devcenter.heroku.com/articles/quickstart

### create a new repo with rails at root diretory
	limingth@gmail ~/Github$ git clone git@github.com:limingth/wikiful.git
	Cloning into 'wikiful'...
	remote: Counting objects: 3, done.
	remote: Compressing objects: 100% (2/2), done.
	remote: Total 3 (delta 0), reused 0 (delta 0)
	Receiving objects: 100% (3/3), done.
	Checking connectivity... done
	limingth@gmail ~/Github$ cd wikiful/
	limingth@gmail ~/Github/wikiful$ ls
	README.md
	limingth@gmail ~/Github/wikiful$ cp ../myRoR/wikiful/
	.gitignore     Gemfile.lock   Rakefile       bin/           config.ru      doc/           lib/           public/        tmp/
	Gemfile        README.rdoc    app/           config/        db/            dvdrental.tar  log/           test/          vendor/
	limingth@gmail ~/Github/wikiful$ cp -R ../myRoR/wikiful/ . 
	limingth@gmail ~/Github/wikiful$ ls
	Gemfile		README.md	Rakefile	bin		config.ru	doc		lib		public		tmp
	Gemfile.lock	README.rdoc	app		config		db		dvdrental.tar	log		test		vendor
	limingth@gmail ~/Github/wikiful$ git status
	# On branch master
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	.gitignore
	#	Gemfile
	#	Gemfile.lock
	#	README.rdoc
	#	Rakefile
	#	app/
	#	bin/
	#	config.ru
	#	config/
	#	db/
	#	doc/
	#	dvdrental.tar
	#	lib/
	#	log/
	#	public/
	#	test/
	#	vendor/
	nothing added to commit but untracked files present (use "git add" to track)
	limingth@gmail ~/Github/wikiful$ git add .
	limingth@gmail ~/Github/wikiful$ git commit -a -m "move wikiful project from myRoR"
	[master a8e4689] move wikiful project from myRoR
	 145 files changed, 3794 insertions(+)
	 create mode 100644 .gitignore
	 create mode 100644 Gemfile
	 create mode 100644 Gemfile.lock
	 create mode 100644 README.rdoc
	 create mode 100644 Rakefile
	 create mode 100644 app/assets/images/.keep
	 create mode 100644 app/assets/javascripts/application.js
	 create mode 100644 app/assets/javascripts/bootstrap.js.coffee
	 create mode 100644 app/assets/javascripts/sessions.js.coffee
	 create mode 100644 app/assets/javascripts/users.js.coffee
	 create mode 100644 app/assets/javascripts/welcome.js.coffee
	 create mode 100644 app/assets/stylesheets/application.css
	 create mode 100644 app/assets/stylesheets/bootstrap_and_overrides.css.less
	 create mode 100644 app/assets/stylesheets/sessions.css.scss
	 create mode 100644 app/assets/stylesheets/users.css.scss
	 create mode 100644 app/assets/stylesheets/welcome.css.scss
	 create mode 100644 app/controllers/application_controller.rb
	 create mode 100644 app/controllers/articles_controller.rb
	 create mode 100644 app/controllers/categories_controller.rb
	 create mode 100644 app/controllers/concerns/.keep
	 create mode 100644 app/controllers/sessions_controller.rb
	 create mode 100644 app/controllers/users_controller.rb
	 create mode 100644 app/controllers/welcome_controller.rb
	 create mode 100644 app/helpers/application_helper.rb
	 create mode 100644 app/helpers/sessions_helper.rb
	 create mode 100644 app/helpers/users_helper.rb
	 create mode 100644 app/helpers/welcome_helper.rb
	 create mode 100644 app/mailers/.keep
	 create mode 100644 app/models/.keep
	 create mode 100644 app/models/article.rb
	 create mode 100644 app/models/article_category.rb
	 create mode 100644 app/models/category.rb
	 create mode 100644 app/models/concerns/.keep
	 create mode 100644 app/models/user.rb
	 create mode 100644 app/views/articles/_form.html
	 create mode 100644 app/views/articles/_form.html.erb
	 create mode 100644 app/views/articles/edit.html.erb
	 create mode 100644 app/views/articles/index.html.erb
	 create mode 100644 app/views/articles/new.html.erb
	 create mode 100644 app/views/articles/show.html.erb
	 create mode 100644 app/views/categories/index.html.erb
	 create mode 100644 app/views/categories/show.html.erb
	 create mode 100644 app/views/layouts/application.html.erb
	 create mode 100644 app/views/sessions/new.html.erb
	 create mode 100644 app/views/users/new.html.erb
	 create mode 100644 app/views/welcome/index.html.erb
	 create mode 100755 bin/bundle
	 create mode 100755 bin/rails
	 create mode 100755 bin/rake
	 create mode 100644 config.ru
	 create mode 100644 config/application.rb
	 create mode 100644 config/boot.rb
	 create mode 100644 config/database.yml
	 create mode 100644 config/environment.rb
	 create mode 100644 config/environments/development.rb
	 create mode 100644 config/environments/production.rb
	 create mode 100644 config/environments/test.rb
	 create mode 100644 config/initializers/backtrace_silencers.rb
	 create mode 100644 config/initializers/filter_parameter_logging.rb
	 create mode 100644 config/initializers/inflections.rb
	 create mode 100644 config/initializers/mime_types.rb
	 create mode 100644 config/initializers/secret_token.rb
	 create mode 100644 config/initializers/session_store.rb
	 create mode 100644 config/initializers/wrap_parameters.rb
	 create mode 100644 config/locales/en.bootstrap.yml
	 create mode 100644 config/locales/en.yml
	 create mode 100644 config/routes.rb
	 create mode 100644 db/migrate/20131126012459_create_articles.rb
	 create mode 100644 db/migrate/20131126014146_create_article_categories.rb
	 create mode 100644 db/migrate/20131126015934_create_categories.rb
	 create mode 100644 db/migrate/20131203190743_create_users.rb
	 create mode 100644 db/schema.rb
	 create mode 100644 db/seeds.rb
	 create mode 100644 doc/ActiveSupport.html
	 create mode 100644 doc/ActiveSupport/TestCase.html
	 create mode 100644 doc/ActiveSupport/TestCase/ActiveRecord.html
	 create mode 100644 doc/ApplicationController.html
	 create mode 100644 doc/ApplicationHelper.html
	 create mode 100644 doc/Logger.html
	 create mode 100644 doc/Object.html
	 create mode 100644 doc/created.rid
	 create mode 100644 doc/images/add.png
	 create mode 100644 doc/images/arrow_up.png
	 create mode 100644 doc/images/brick.png
	 create mode 100644 doc/images/brick_link.png
	 create mode 100644 doc/images/bug.png
	 create mode 100644 doc/images/bullet_black.png
	 create mode 100644 doc/images/bullet_toggle_minus.png
	 create mode 100644 doc/images/bullet_toggle_plus.png
	 create mode 100644 doc/images/date.png
	 create mode 100644 doc/images/delete.png
	 create mode 100644 doc/images/find.png
	 create mode 100644 doc/images/loadingAnimation.gif
	 create mode 100644 doc/images/macFFBgHack.png
	 create mode 100644 doc/images/package.png
	 create mode 100644 doc/images/page_green.png
	 create mode 100644 doc/images/page_white_text.png
	 create mode 100644 doc/images/page_white_width.png
	 create mode 100644 doc/images/plugin.png
	 create mode 100644 doc/images/ruby.png
	 create mode 100644 doc/images/tag_blue.png
	 create mode 100644 doc/images/tag_green.png
	 create mode 100644 doc/images/transparent.png
	 create mode 100644 doc/images/wrench.png
	 create mode 100644 doc/images/wrench_orange.png
	 create mode 100644 doc/images/zoom.png
	 create mode 100644 doc/index.html
	 create mode 100644 doc/js/darkfish.js
	 create mode 100644 doc/js/jquery.js
	 create mode 100644 doc/js/search.js
	 create mode 100644 doc/rdoc.css
	 create mode 100644 dvdrental.tar
	 create mode 100644 lib/assets/.keep
	 create mode 100644 lib/tasks/.keep
	 create mode 100644 log/.keep
	 create mode 100644 public/404.html
	 create mode 100644 public/422.html
	 create mode 100644 public/500.html
	 create mode 100644 public/favicon.ico
	 create mode 100644 public/robots.txt
	 create mode 100644 test/controllers/.keep
	 create mode 100644 test/controllers/sessions_controller_test.rb
	 create mode 100644 test/controllers/users_controller_test.rb
	 create mode 100644 test/controllers/welcome_controller_test.rb
	 create mode 100644 test/fixtures/.keep
	 create mode 100644 test/fixtures/artical_categories.yml
	 create mode 100644 test/fixtures/article_categories.yml
	 create mode 100644 test/fixtures/articles.yml
	 create mode 100644 test/fixtures/categories.yml
	 create mode 100644 test/fixtures/users.yml
	 create mode 100644 test/helpers/.keep
	 create mode 100644 test/helpers/sessions_helper_test.rb
	 create mode 100644 test/helpers/users_helper_test.rb
	 create mode 100644 test/helpers/welcome_helper_test.rb
	 create mode 100644 test/integration/.keep
	 create mode 100644 test/mailers/.keep
	 create mode 100644 test/models/.keep
	 create mode 100644 test/models/artical_category_test.rb
	 create mode 100644 test/models/article_category_test.rb
	 create mode 100644 test/models/article_test.rb
	 create mode 100644 test/models/category_test.rb
	 create mode 100644 test/models/user_test.rb
	 create mode 100644 test/test_helper.rb
	 create mode 100644 vendor/assets/javascripts/.keep
	 create mode 100644 vendor/assets/stylesheets/.keep
	limingth@gmail ~/Github/wikiful$ git push
	Counting objects: 163, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (150/150), done.
	Writing objects: 100% (162/162), 695.66 KiB | 0 bytes/s, done.
	Total 162 (delta 18), reused 0 (delta 0)
	To git@github.com:limingth/wikiful.git
	   3f9bb2d..a8e4689  master -> master
	limingth@gmail ~/Github/wikiful$ heroku create
	Creating blooming-reaches-9444... done, stack is cedar
	http://blooming-reaches-9444.herokuapp.com/ | git@heroku.com:blooming-reaches-9444.git
	Git remote heroku added
	limingth@gmail ~/Github/wikiful$ git config -e
	limingth@gmail ~/Github/wikiful$ git push heroku master
	Counting objects: 165, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (152/152), done.
	Writing objects: 100% (165/165), 695.88 KiB | 462.00 KiB/s, done.
	Total 165 (delta 18), reused 3 (delta 0)

	-----> Ruby app detected
	-----> Compiling Ruby/Rails
	-----> Using Ruby version: ruby-2.0.0
	-----> Installing dependencies using Bundler version 1.3.2
	       New app detected loading default bundler cache
	       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
	       You are trying to install in deployment mode after changing
	       your Gemfile. Run `bundle install` elsewhere and add the
	       updated Gemfile.lock to version control.
	       You have added to the Gemfile:
	       * rails_12factor
	       Bundler Output: You are trying to install in deployment mode after changing
	       your Gemfile. Run `bundle install` elsewhere and add the
	       updated Gemfile.lock to version control.
	       
	       You have added to the Gemfile:
	       * rails_12factor
	 !
	 !     Failed to install gems via Bundler.
	 !

	 !     Push rejected, failed to compile Ruby app

	To git@heroku.com:blooming-reaches-9444.git
	 ! [remote rejected] master -> master (pre-receive hook declined)
	error: failed to push some refs to 'git@heroku.com:blooming-reaches-9444.git'
	limingth@gmail ~/Github/wikiful$ vi Gemfile
	limingth@gmail ~/Github/wikiful$ bundle install
	Fetching gem metadata from https://rubygems.org/...........
	Fetching gem metadata from https://rubygems.org/..
	Resolving dependencies...
	Using rake (10.1.0) 
	Using i18n (0.6.5) 
	Using minitest (4.7.5) 
	Using multi_json (1.8.2) 
	Using atomic (1.1.14) 
	Using thread_safe (0.1.3) 
	Using tzinfo (0.3.38) 
	Using activesupport (4.0.1) 
	Using builder (3.1.4) 
	Using erubis (2.7.0) 
	Using rack (1.5.2) 
	Using rack-test (0.6.2) 
	Using actionpack (4.0.1) 
	Using mime-types (1.25) 
	Using polyglot (0.3.3) 
	Using treetop (1.4.15) 
	Using mail (2.5.4) 
	Using actionmailer (4.0.1) 
	Using activemodel (4.0.1) 
	Using activerecord-deprecated_finders (1.0.3) 
	Using arel (4.0.1) 
	Using activerecord (4.0.1) 
	Using bcrypt-ruby (3.1.2) 
	Using bundler (1.3.5) 
	Using coffee-script-source (1.6.3) 
	Using execjs (2.0.2) 
	Using coffee-script (2.2.0) 
	Using thor (0.18.1) 
	Using railties (4.0.1) 
	Using coffee-rails (4.0.1) 
	Using commonjs (0.2.7) 
	Using faker (1.2.0) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Using less (2.4.0) 
	Using less-rails (2.4.2) 
	Using libv8 (3.16.14.3) 
	Using pg (0.17.0) 
	Using tilt (1.4.1) 
	Using sprockets (2.10.0) 
	Using sprockets-rails (2.0.1) 
	Using rails (4.0.1) 
	Installing rails_serve_static_assets (0.0.1) 
	Installing rails_stdout_logging (0.0.3) 
	Installing rails_12factor (0.0.2) 
	Using rdoc (3.12.2) 
	Using ref (1.0.5) 
	Using sass (3.2.12) 
	Using sass-rails (4.0.1) 
	Using sdoc (0.3.20) 
	Using therubyracer (0.12.0) 
	Using turbolinks (1.3.1) 
	Using twitter-bootstrap-rails (2.2.8) 
	Using uglifier (2.3.1) 
	Your bundle is complete!
	Use `bundle show [gemname]` to see where a bundled gem is installed.

### .DS_store is VERY IMPORTANT

	limingth@gmail ~/Github/wikiful$ vi .git/config 
	limingth@gmail ~/Github/wikiful$ git push heroku master
	Counting objects: 165, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (152/152), done.
	Writing objects: 100% (165/165), 695.88 KiB | 307.00 KiB/s, done.
	Total 165 (delta 18), reused 3 (delta 0)

	-----> Ruby app detected
	-----> Compiling Ruby/Rails
	-----> Using Ruby version: ruby-2.0.0
	-----> Installing dependencies using Bundler version 1.3.2
	       New app detected loading default bundler cache
	       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
	       You are trying to install in deployment mode after changing
	       your Gemfile. Run `bundle install` elsewhere and add the
	       updated Gemfile.lock to version control.
	       You have added to the Gemfile:
	       * rails_12factor
	       Bundler Output: You are trying to install in deployment mode after changing
	       your Gemfile. Run `bundle install` elsewhere and add the
	       updated Gemfile.lock to version control.
	       
	       You have added to the Gemfile:
	       * rails_12factor
	 !
	 !     Failed to install gems via Bundler.
	 !

	 !     Push rejected, failed to compile Ruby app

	To git@heroku.com:blooming-reaches-9444.git
	 ! [remote rejected] master -> master (pre-receive hook declined)
	error: failed to push some refs to 'git@heroku.com:blooming-reaches-9444.git'
	limingth@gmail ~/Github/wikiful$ ls -a
	.		.gitignore	README.md	app		config.ru	dvdrental.tar	public		vendor
	..		Gemfile		README.rdoc	bin		db		lib		test
	.git		Gemfile.lock	Rakefile	config		doc		log		tmp
	limingth@gmail ~/Github/wikiful$ ls -a
	.		.gitignore	README.md	app		config.ru	dvdrental.tar	public		vendor
	..		Gemfile		README.rdoc	bin		db		lib		test
	.git		Gemfile.lock	Rakefile	config		doc		log		tmp
	limingth@gmail ~/Github/wikiful$ mv /tmp/.DS_Store .
	limingth@gmail ~/Github/wikiful$ ls
	Gemfile		README.md	Rakefile	bin		config.ru	doc		lib		public		tmp
	Gemfile.lock	README.rdoc	app		config		db		dvdrental.tar	log		test		vendor
	limingth@gmail ~/Github/wikiful$ git push heroku master
	Counting objects: 165, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (152/152), done.
	Writing objects: 100% (165/165), 695.88 KiB | 391.00 KiB/s, done.
	Total 165 (delta 18), reused 3 (delta 0)

	-----> Ruby app detected
	-----> Compiling Ruby/Rails
	-----> Using Ruby version: ruby-2.0.0
	-----> Installing dependencies using Bundler version 1.3.2
	       New app detected loading default bundler cache
	       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
	       You are trying to install in deployment mode after changing
	       your Gemfile. Run `bundle install` elsewhere and add the
	       updated Gemfile.lock to version control.
	       You have added to the Gemfile:
	       * rails_12factor
	       Bundler Output: You are trying to install in deployment mode after changing
	       your Gemfile. Run `bundle install` elsewhere and add the
	       updated Gemfile.lock to version control.
	       
	       You have added to the Gemfile:
	       * rails_12factor
	 !
	 !     Failed to install gems via Bundler.
	 !

	 !     Push rejected, failed to compile Ruby app

	To git@heroku.com:blooming-reaches-9444.git
	 ! [remote rejected] master -> master (pre-receive hook declined)
	error: failed to push some refs to 'git@heroku.com:blooming-reaches-9444.git'
	limingth@gmail ~/Github/wikiful$ git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   Gemfile
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	.DS_Store
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/wikiful$ vi .DS_Store 
	limingth@gmail ~/Github/wikiful$ git add .DS_Store 
	limingth@gmail ~/Github/wikiful$ git commit -a -m "add .DS_store"
	[master e62d78a] add .DS_store
	 2 files changed, 5 deletions(-)
	 create mode 100644 .DS_Store
	limingth@gmail ~/Github/wikiful$ git push
	Counting objects: 6, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (4/4), done.
	Writing objects: 100% (4/4), 516 bytes | 0 bytes/s, done.
	Total 4 (delta 2), reused 0 (delta 0)
	To git@github.com:limingth/wikiful.git
	   a8e4689..e62d78a  master -> master
	limingth@gmail ~/Github/wikiful$ git push heroku master
	Counting objects: 169, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (156/156), done.
	Writing objects: 100% (169/169), 696.31 KiB | 472.00 KiB/s, done.
	Total 169 (delta 20), reused 3 (delta 0)

	-----> Removing .DS_Store files
	-----> Ruby app detected
	-----> Compiling Ruby/Rails
	-----> Using Ruby version: ruby-2.0.0
	-----> Installing dependencies using Bundler version 1.3.2
	       New app detected loading default bundler cache
	       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
	       Fetching gem metadata from https://rubygems.org/..........
	       Fetching gem metadata from https://rubygems.org/..
	       Using rake (10.1.0)
	       Using i18n (0.6.5)
	       Using minitest (4.7.5)
	       Using multi_json (1.8.2)
	       Using atomic (1.1.14)
	       Using thread_safe (0.1.3)
	       Using tzinfo (0.3.38)
	       Using activesupport (4.0.1)
	       Using builder (3.1.4)
	       Using erubis (2.7.0)
	       Using rack (1.5.2)
	       Using rack-test (0.6.2)
	       Using actionpack (4.0.1)
	       Using mime-types (1.25)
	       Using polyglot (0.3.3)
	       Using treetop (1.4.15)
	       Using mail (2.5.4)
	       Using actionmailer (4.0.1)
	       Using activemodel (4.0.1)
	       Using activerecord-deprecated_finders (1.0.3)
	       Using arel (4.0.1)
	       Using activerecord (4.0.1)
	       Using bcrypt-ruby (3.1.2)
	       Using coffee-script-source (1.6.3)
	       Using execjs (2.0.2)
	       Using coffee-script (2.2.0)
	       Using thor (0.18.1)
	       Using railties (4.0.1)
	       Using coffee-rails (4.0.1)
	       Installing commonjs (0.2.7)
	       Using hike (1.2.3)
	       Using jbuilder (1.5.2)
	       Using jquery-rails (3.0.4)
	       Using json (1.8.1)
	       Installing less (2.4.0)
	       Installing less-rails (2.4.2)
	       Installing libv8 (3.16.14.3)
	       Using pg (0.17.0)
	       Using bundler (1.3.2)
	       Using tilt (1.4.1)
	       Using sprockets (2.10.0)
	       Using sprockets-rails (2.0.1)
	       Using rails (4.0.1)
	       Using rdoc (3.12.2)
	       Installing ref (1.0.5)
	       Using sass (3.2.12)
	       Using sass-rails (4.0.1)
	       Using sdoc (0.3.20)
	       Installing therubyracer (0.12.0)
	       Using turbolinks (1.3.1)
	       Installing twitter-bootstrap-rails (2.2.8)
	       Using uglifier (2.3.1)
	       Your bundle is complete! It was installed into ./vendor/bundle
	       Post-install message from twitter-bootstrap-rails:
	       Important: You may need to add a javascript runtime to your Gemfile in order for bootstrap's LESS files to compile to CSS.
	       **********************************************
	       ExecJS supports these runtimes:
	       therubyracer - Google V8 embedded within Ruby
	       therubyrhino - Mozilla Rhino embedded within JRuby
	       Node.js
	       Apple JavaScriptCore - Included with Mac OS X
	       Microsoft Windows Script Host (JScript)
	       **********************************************
	       Bundle completed (29.61s)
	       Cleaning up the bundler cache.
	       Removing raindrops (0.12.0)
	       Removing actionmailer (3.2.14)
	       Removing json (1.8.0)
	       Removing rails_12factor (0.0.2)
	       Removing rails_serve_static_assets (0.0.1)
	       Removing mini_portile (0.5.1)
	       Removing kgio (2.8.1)
	       Removing uglifier (2.2.1)
	       Removing journey (1.0.4)
	       Removing activeresource (3.2.14)
	       Removing execjs (2.0.1)
	       Removing actionpack (3.2.14)
	       Removing sass (3.2.10)
	       Removing bcrypt-ruby (3.0.1)
	       Removing activesupport (3.2.14)
	       Removing sprockets (2.2.2)
	       Removing rack-cache (1.2)
	       Removing jbuilder (1.5.1)
	       Removing tzinfo (0.3.37)
	       Removing nokogiri (1.6.0)
	       Removing coffee-rails (3.2.2)
	       Removing rails_stdout_logging (0.0.2)
	       Removing activerecord (3.2.14)
	       Removing rails_stdout_logging (0.0.3)
	       Removing builder (3.0.4)
	       Removing arel (3.0.2)
	       Removing railties (3.2.14)
	       Removing multi_json (1.8.0)
	       Removing sass-rails (3.2.6)
	       Removing rack-ssl (1.3.3)
	       Removing rack (1.4.5)
	       Removing rails (3.2.14)
	       Removing activemodel (3.2.14)
	       Removing puma (2.6.0)
	       Removing unicorn (4.6.3)
	-----> Writing config/database.yml to read from DATABASE_URL
	-----> Preparing app for Rails asset pipeline
	       Running: rake assets:precompile
	       I, [2013-12-04T02:25:00.455689 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/application-f3b21ecd7532a0370b1223790ce28550.js
	       I, [2013-12-04T02:25:03.456498 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/application-8483d0d440dda3cafe8492a00fcfb089.css
	       I, [2013-12-04T02:25:03.464229 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/fontawesome-webfont-0c21817ea1936b34152cd8667063693e.eot
	       I, [2013-12-04T02:25:03.472705 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/fontawesome-webfont-57bf98de995c161f5ba6d1593c404b0e.svg
	       I, [2013-12-04T02:25:03.480344 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/fontawesome-webfont-1ec5a4da0b1ef880613bcf2fb3e5ff1a.ttf
	       I, [2013-12-04T02:25:03.483819 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/fontawesome-webfont-d27b443462279070c06479858548ceb9.woff
	       I, [2013-12-04T02:25:03.506983 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/twitter/bootstrap/glyphicons-halflings-white-2fa53df59ca25ee50f59f971c0c9175d.png
	       I, [2013-12-04T02:25:03.525570 #1027]  INFO -- : Writing /tmp/build_5bac0a87-5ec5-44d6-bf4b-892eb068d86f/public/assets/twitter/bootstrap/glyphicons-halflings-4e5b89324f1ac987ddf6835ef51f5fe9.png
	       Asset precompilation completed (10.59s)
	       Cleaning assets
	-----> WARNINGS:
	       Include 'rails_12factor' gem to enable all platform features
	       See https://devcenter.heroku.com/articles/rails-integration-gems for more information.
	       
	       You have not declared a Ruby version in your Gemfile.
	       To set your Ruby version add this line to your Gemfile:
	       ruby '2.0.0'
	       # See https://devcenter.heroku.com/articles/ruby-versions for more information.
	-----> Discovering process types
	       Procfile declares types -> (none)
	       Default types for Ruby  -> console, rake, web, worker

	-----> Compiled slug size: 33.6MB
	-----> Launching... done, v5
	       http://blooming-reaches-9444.herokuapp.com deployed to Heroku

	To git@heroku.com:blooming-reaches-9444.git
	 * [new branch]      master -> master
	limingth@gmail ~/Github/wikiful$ 

### Migrate your database
	limingth@gmail ~/Github/wikiful$ heroku run rake db:migrate
	Running `rake db:migrate` attached to terminal... up, run.2305
	==  CreateArticles: migrating =================================================
	-- create_table(:articles)
	   -> 0.0319s
	==  CreateArticles: migrated (0.0321s) ========================================

	==  CreateArticleCategories: migrating ========================================
	-- create_table(:article_categories)
	   -> 0.0167s
	==  CreateArticleCategories: migrated (0.0169s) ===============================

	==  CreateCategories: migrating ===============================================
	-- create_table(:categories)
	   -> 0.0162s
	==  CreateCategories: migrated (0.0163s) ======================================

	==  CreateUsers: migrating ====================================================
	-- create_table(:users)
	   -> 0.0315s
	==  CreateUsers: migrated (0.0317s) ===========================================

	limingth@gmail ~/Github/wikiful$ 

### have one dyno running the web process type
	limingth@gmail ~/Github/wikiful$ heroku ps:scale web=1
	Scaling web dynos... done, now running 1

	limingth@gmail ~/Github/wikiful$ heroku ps
	=== web (1X): `bin/rails server -p $PORT -e $RAILS_ENV`
	web.1: up 2013/12/03 18:25:29 (~ 2m ago)

	limingth@gmail ~/Github/wikiful$ 

### visit the app in our browser 
	limingth@gmail ~/Github/wikiful$ heroku open
	Opening blooming-reaches-9444... done
	limingth@gmail ~/Github/wikiful$ 

### redo it
	limingth@gmail ~/Github/wikiful$ heroku create wiki_site_limingth
	 !    Name must start with a letter and can only contain lowercase letters, numbers, and dashes.
	 !    You've reached the limit of 5 apps for unverified accounts.
	 !    Add a credit card to verify your account.
	limingth@gmail ~/Github/wikiful$ heroku create wiki_site_limingth
	 !    Name must start with a letter and can only contain lowercase letters, numbers, and dashes.
	limingth@gmail ~/Github/wikiful$ heroku create wiki-site-limingth
	Creating wiki-site-limingth... done, stack is cedar
	http://wiki-site-limingth.herokuapp.com/ | git@heroku.com:wiki-site-limingth.git
	limingth@gmail ~/Github/wikiful$ git push heroku master

	 !  No such app as blooming-reaches-9444.

	fatal: Could not read from remote repository.

	Please make sure you have the correct access rights
	and the repository exists.
	limingth@gmail ~/Github/wikiful$ git config -e
	limingth@gmail ~/Github/wikiful$ git push heroku master
	Counting objects: 169, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (156/156), done.
	Writing objects: 100% (169/169), 696.31 KiB | 474.00 KiB/s, done.
	Total 169 (delta 20), reused 3 (delta 0)

	-----> Removing .DS_Store files
	-----> Ruby app detected
	-----> Compiling Ruby/Rails
	-----> Using Ruby version: ruby-2.0.0
	-----> Installing dependencies using Bundler version 1.3.2
	       New app detected loading default bundler cache
	       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
	       Fetching gem metadata from https://rubygems.org/..........
	       Fetching gem metadata from https://rubygems.org/..
	       Using rake (10.1.0)
	       Using i18n (0.6.5)
	       Using minitest (4.7.5)
	       Using multi_json (1.8.2)
	       Using atomic (1.1.14)
	       Using thread_safe (0.1.3)
	       Using tzinfo (0.3.38)
	       Using activesupport (4.0.1)
	       Using builder (3.1.4)
	       Using erubis (2.7.0)
	       Using rack (1.5.2)
	       Using rack-test (0.6.2)
	       Using actionpack (4.0.1)
	       Using mime-types (1.25)
	       Using polyglot (0.3.3)
	       Using treetop (1.4.15)
	       Using mail (2.5.4)
	       Using actionmailer (4.0.1)
	       Using activemodel (4.0.1)
	       Using activerecord-deprecated_finders (1.0.3)
	       Using arel (4.0.1)
	       Using activerecord (4.0.1)
	       Using bcrypt-ruby (3.1.2)
	       Using coffee-script-source (1.6.3)
	       Using execjs (2.0.2)
	       Using coffee-script (2.2.0)
	       Using thor (0.18.1)
	       Using railties (4.0.1)
	       Using coffee-rails (4.0.1)
	       Installing commonjs (0.2.7)
	       Using hike (1.2.3)
	       Using jbuilder (1.5.2)
	       Using jquery-rails (3.0.4)
	       Using json (1.8.1)
	       Installing less (2.4.0)
	       Installing less-rails (2.4.2)
	       Installing libv8 (3.16.14.3)
	       Using pg (0.17.0)
	       Using bundler (1.3.2)
	       Using tilt (1.4.1)
	       Using sprockets (2.10.0)
	       Using sprockets-rails (2.0.1)
	       Using rails (4.0.1)
	       Using rdoc (3.12.2)
	       Installing ref (1.0.5)
	       Using sass (3.2.12)
	       Using sass-rails (4.0.1)
	       Using sdoc (0.3.20)
	       Installing therubyracer (0.12.0)
	       Using turbolinks (1.3.1)
	       Installing twitter-bootstrap-rails (2.2.8)
	       Using uglifier (2.3.1)
	       Your bundle is complete! It was installed into ./vendor/bundle
	       Post-install message from twitter-bootstrap-rails:
	       Important: You may need to add a javascript runtime to your Gemfile in order for bootstrap's LESS files to compile to CSS.
	       **********************************************
	       ExecJS supports these runtimes:
	       therubyracer - Google V8 embedded within Ruby
	       therubyrhino - Mozilla Rhino embedded within JRuby
	       Node.js
	       Apple JavaScriptCore - Included with Mac OS X
	       Microsoft Windows Script Host (JScript)
	       **********************************************
	       Bundle completed (38.10s)
	       Cleaning up the bundler cache.
	       Removing nokogiri (1.6.0)
	       Removing coffee-rails (3.2.2)
	       Removing builder (3.0.4)
	       Removing journey (1.0.4)
	       Removing rails_12factor (0.0.2)
	       Removing activeresource (3.2.14)
	       Removing json (1.8.0)
	       Removing activesupport (3.2.14)
	       Removing activemodel (3.2.14)
	       Removing puma (2.6.0)
	       Removing rails_stdout_logging (0.0.2)
	       Removing rails (3.2.14)
	       Removing raindrops (0.12.0)
	       Removing mini_portile (0.5.1)
	       Removing jbuilder (1.5.1)
	       Removing tzinfo (0.3.37)
	       Removing rack-cache (1.2)
	       Removing rails_serve_static_assets (0.0.1)
	       Removing activerecord (3.2.14)
	       Removing sass (3.2.10)
	       Removing rack-ssl (1.3.3)
	       Removing unicorn (4.6.3)
	       Removing multi_json (1.8.0)
	       Removing rack (1.4.5)
	       Removing rails_stdout_logging (0.0.3)
	       Removing actionmailer (3.2.14)
	       Removing sprockets (2.2.2)
	       Removing uglifier (2.2.1)
	       Removing execjs (2.0.1)
	       Removing arel (3.0.2)
	       Removing railties (3.2.14)
	       Removing actionpack (3.2.14)
	       Removing bcrypt-ruby (3.0.1)
	       Removing sass-rails (3.2.6)
	       Removing kgio (2.8.1)
	-----> Writing config/database.yml to read from DATABASE_URL
	-----> Preparing app for Rails asset pipeline
	       Running: rake assets:precompile
	       I, [2013-12-04T02:39:11.416040 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/application-f3b21ecd7532a0370b1223790ce28550.js
	       I, [2013-12-04T02:39:20.507107 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/application-8483d0d440dda3cafe8492a00fcfb089.css
	       I, [2013-12-04T02:39:20.532505 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/fontawesome-webfont-0c21817ea1936b34152cd8667063693e.eot
	       I, [2013-12-04T02:39:20.533838 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/fontawesome-webfont-57bf98de995c161f5ba6d1593c404b0e.svg
	       I, [2013-12-04T02:39:20.537448 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/fontawesome-webfont-1ec5a4da0b1ef880613bcf2fb3e5ff1a.ttf
	       I, [2013-12-04T02:39:20.547518 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/fontawesome-webfont-d27b443462279070c06479858548ceb9.woff
	       I, [2013-12-04T02:39:20.549673 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/twitter/bootstrap/glyphicons-halflings-white-2fa53df59ca25ee50f59f971c0c9175d.png
	       I, [2013-12-04T02:39:20.551741 #1114]  INFO -- : Writing /tmp/build_bef85a9b-38f1-46f8-9508-341ccc15e078/public/assets/twitter/bootstrap/glyphicons-halflings-4e5b89324f1ac987ddf6835ef51f5fe9.png
	       Asset precompilation completed (16.95s)
	       Cleaning assets
	-----> WARNINGS:
	       Include 'rails_12factor' gem to enable all platform features
	       See https://devcenter.heroku.com/articles/rails-integration-gems for more information.
	       
	       You have not declared a Ruby version in your Gemfile.
	       To set your Ruby version add this line to your Gemfile:
	       ruby '2.0.0'
	       # See https://devcenter.heroku.com/articles/ruby-versions for more information.
	-----> Discovering process types
	       Procfile declares types -> (none)
	       Default types for Ruby  -> console, rake, web, worker

	-----> Compiled slug size: 33.6MB
	-----> Launching... done, v5
	       http://wiki-site-limingth.herokuapp.com deployed to Heroku

	To git@heroku.com:wiki-site-limingth.git
	 * [new branch]      master -> master
	limingth@gmail ~/Github/wikiful$ 

	limingth@gmail ~/Github/wikiful$ heroku run rake db:migrate
	Running `rake db:migrate` attached to terminal... up, run.8815
	==  CreateArticles: migrating =================================================
	-- create_table(:articles)
	   -> 0.0677s
	==  CreateArticles: migrated (0.0688s) ========================================

	==  CreateArticleCategories: migrating ========================================
	-- create_table(:article_categories)
	   -> 0.0306s
	==  CreateArticleCategories: migrated (0.0312s) ===============================

	==  CreateCategories: migrating ===============================================
	-- create_table(:categories)
	   -> 0.0284s
	==  CreateCategories: migrated (0.0289s) ======================================

	==  CreateUsers: migrating ====================================================
	-- create_table(:users)
	   -> 0.1165s
	==  CreateUsers: migrated (0.1169s) ===========================================

	limingth@gmail ~/Github/wikiful$ 

	limingth@gmail ~/Github/wikiful$ heroku ps:scale web=1
	Scaling web dynos... done, now running 1
	limingth@gmail ~/Github/wikiful$ heroku ps
	=== web (1X): `bin/rails server -p $PORT -e $RAILS_ENV`
	web.1: up 2013/12/03 18:40:04 (~ 1m ago)

	limingth@gmail ~/Github/wikiful$ heroku open
	Opening wiki-site-limingth... done
	limingth@gmail ~/Github/wikiful$ 

* Now you can see wikiful running in browser


### redo it
	limingth@gmail ~/Github/wikiful$ git push heroku master
	Everything up-to-date
	limingth@gmail ~/Github/wikiful$ git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   Gemfile
	#	modified:   Gemfile.lock
	#
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/wikiful$ git add Gemfile Gemfile.lock 
	limingth@gmail ~/Github/wikiful$ git commit -a -m "M Gemfile"
	[master b16e7e7] M Gemfile
	 2 files changed, 7 insertions(+)
	limingth@gmail ~/Github/wikiful$ git push
	Counting objects: 7, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (4/4), done.
	Writing objects: 100% (4/4), 495 bytes | 0 bytes/s, done.
	Total 4 (delta 3), reused 0 (delta 0)
	To git@github.com:limingth/wikiful.git
	   e62d78a..b16e7e7  master -> master
	limingth@gmail ~/Github/wikiful$ git push heroku master
	Counting objects: 7, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (4/4), done.
	Writing objects: 100% (4/4), 495 bytes | 0 bytes/s, done.
	Total 4 (delta 3), reused 0 (delta 0)

	-----> Removing .DS_Store files
	-----> Ruby app detected
	-----> Compiling Ruby/Rails
	-----> Using Ruby version: ruby-2.0.0
	-----> Installing dependencies using Bundler version 1.3.2
	       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
	       Fetching gem metadata from https://rubygems.org/..........
	       Fetching gem metadata from https://rubygems.org/..
	       Using rake (10.1.0)
	       Using i18n (0.6.5)
	       Using minitest (4.7.5)
	       Using multi_json (1.8.2)
	       Using atomic (1.1.14)
	       Using thread_safe (0.1.3)
	       Using tzinfo (0.3.38)
	       Using activesupport (4.0.1)
	       Using builder (3.1.4)
	       Using erubis (2.7.0)
	       Using rack (1.5.2)
	       Using rack-test (0.6.2)
	       Using actionpack (4.0.1)
	       Using mime-types (1.25)
	       Using polyglot (0.3.3)
	       Using treetop (1.4.15)
	       Using mail (2.5.4)
	       Using actionmailer (4.0.1)
	       Using activemodel (4.0.1)
	       Using activerecord-deprecated_finders (1.0.3)
	       Using arel (4.0.1)
	       Using activerecord (4.0.1)
	       Using bcrypt-ruby (3.1.2)
	       Using coffee-script-source (1.6.3)
	       Using execjs (2.0.2)
	       Using coffee-script (2.2.0)
	       Using thor (0.18.1)
	       Using railties (4.0.1)
	       Using coffee-rails (4.0.1)
	       Using commonjs (0.2.7)
	       Using hike (1.2.3)
	       Using jbuilder (1.5.2)
	       Using jquery-rails (3.0.4)
	       Using json (1.8.1)
	       Using less (2.4.0)
	       Using less-rails (2.4.2)
	       Using libv8 (3.16.14.3)
	       Using pg (0.17.0)
	       Using bundler (1.3.2)
	       Using tilt (1.4.1)
	       Using sprockets (2.10.0)
	       Using sprockets-rails (2.0.1)
	       Using rails (4.0.1)
	       Installing rails_serve_static_assets (0.0.1)
	       Installing rails_stdout_logging (0.0.3)
	       Installing rails_12factor (0.0.2)
	       Using rdoc (3.12.2)
	       Using ref (1.0.5)
	       Using sass (3.2.12)
	       Using sass-rails (4.0.1)
	       Using sdoc (0.3.20)
	       Using therubyracer (0.12.0)
	       Using turbolinks (1.3.1)
	       Using twitter-bootstrap-rails (2.2.8)
	       Using uglifier (2.3.1)
	       Your bundle is complete! It was installed into ./vendor/bundle
	       Bundle completed (17.39s)
	       Cleaning up the bundler cache.
	-----> Writing config/database.yml to read from DATABASE_URL
	-----> Preparing app for Rails asset pipeline
	       Running: rake assets:precompile
	       Asset precompilation completed (10.10s)
	       Cleaning assets
	-----> WARNINGS:
	       You have not declared a Ruby version in your Gemfile.
	       To set your Ruby version add this line to your Gemfile:
	       ruby '2.0.0'
	       # See https://devcenter.heroku.com/articles/ruby-versions for more information.
	-----> Discovering process types
	       Procfile declares types -> (none)
	       Default types for Ruby  -> console, rake, web, worker

	-----> Compiled slug size: 33.7MB
	-----> Launching... done, v6
	       http://wiki-site-limingth.herokuapp.com deployed to Heroku

	To git@heroku.com:wiki-site-limingth.git
	   e62d78a..b16e7e7  master -> master
	limingth@gmail ~/Github/wikiful$ 

## Get to Know Heroku Better

