
# My Own Project userhub - a website User Registration Management Information System

## Step 1 - build the project from scratch

### rails new
	limingth@gmail ~/Github/myRoR$ rails new userhub
	      create  
	      create  README.rdoc
	      create  Rakefile
	      create  config.ru
	      create  .gitignore
	      create  Gemfile
	      create  app
	      create  app/assets/javascripts/application.js
	      create  app/assets/stylesheets/application.css
	      create  app/controllers/application_controller.rb
	      create  app/helpers/application_helper.rb
	      create  app/views/layouts/application.html.erb
	      create  app/assets/images/.keep
	      create  app/mailers/.keep
	      create  app/models/.keep
	      create  app/controllers/concerns/.keep
	      create  app/models/concerns/.keep
	      create  bin
	      create  bin/bundle
	      create  bin/rails
	      create  bin/rake
	      create  config
	      create  config/routes.rb
	      create  config/application.rb
	      create  config/environment.rb
	      create  config/environments
	      create  config/environments/development.rb
	      create  config/environments/production.rb
	      create  config/environments/test.rb
	      create  config/initializers
	      create  config/initializers/backtrace_silencers.rb
	      create  config/initializers/filter_parameter_logging.rb
	      create  config/initializers/inflections.rb
	      create  config/initializers/mime_types.rb
	      create  config/initializers/secret_token.rb
	      create  config/initializers/session_store.rb
	      create  config/initializers/wrap_parameters.rb
	      create  config/locales
	      create  config/locales/en.yml
	      create  config/boot.rb
	      create  config/database.yml
	      create  db
	      create  db/seeds.rb
	      create  lib
	      create  lib/tasks
	      create  lib/tasks/.keep
	      create  lib/assets
	      create  lib/assets/.keep
	      create  log
	      create  log/.keep
	      create  public
	      create  public/404.html
	      create  public/422.html
	      create  public/500.html
	      create  public/favicon.ico
	      create  public/robots.txt
	      create  test/fixtures
	      create  test/fixtures/.keep
	      create  test/controllers
	      create  test/controllers/.keep
	      create  test/mailers
	      create  test/mailers/.keep
	      create  test/models
	      create  test/models/.keep
	      create  test/helpers
	      create  test/helpers/.keep
	      create  test/integration
	      create  test/integration/.keep
	      create  test/test_helper.rb
	      create  tmp/cache
	      create  tmp/cache/assets
	      create  vendor/assets/javascripts
	      create  vendor/assets/javascripts/.keep
	      create  vendor/assets/stylesheets
	      create  vendor/assets/stylesheets/.keep
	         run  bundle install
	Fetching gem metadata from https://rubygems.org/..........
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
	Using mime-types (1.25.1) 
	Using polyglot (0.3.3) 
	Using treetop (1.4.15) 
	Using mail (2.5.4) 
	Using actionmailer (4.0.1) 
	Using activemodel (4.0.1) 
	Using activerecord-deprecated_finders (1.0.3) 
	Using arel (4.0.1) 
	Using activerecord (4.0.1) 
	Using bundler (1.3.5) 
	Using coffee-script-source (1.6.3) 
	Using execjs (2.0.2) 
	Using coffee-script (2.2.0) 
	Using thor (0.18.1) 
	Using railties (4.0.1) 
	Using coffee-rails (4.0.1) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Using tilt (1.4.1) 
	Using sprockets (2.10.1) 
	Using sprockets-rails (2.0.1) 
	Using rails (4.0.1) 
	Using rdoc (3.12.2) 
	Using sass (3.2.12) 
	Using sass-rails (4.0.1) 
	Using sdoc (0.3.20) 
	Using sqlite3 (1.3.8) 
	Using turbolinks (1.3.1) 
	Using uglifier (2.3.1) 
	Your bundle is complete!
	Use `bundle show [gemname]` to see where a bundled gem is installed.
	limingth@gmail ~/Github/myRoR$

### start rails server
	limingth@gmail ~/Github/myRoR/$ cd userhub
	limingth@gmail ~/Github/myRoR/userhub$ rails s
	=> Booting WEBrick
	=> Rails 4.0.1 application starting in development on http://0.0.0.0:3000
	=> Run `rails server -h` for more startup options
	=> Ctrl-C to shutdown server
	[2013-11-28 08:28:55] INFO  WEBrick 1.3.1
	[2013-11-28 08:28:55] INFO  ruby 2.0.0 (2013-06-27) [x86_64-darwin12.4.0]
	[2013-11-28 08:28:55] INFO  WEBrick::HTTPServer#start: pid=23143 port=3000

### in web browser http://localhost:3000

	Welcome aboard
	You’re riding Ruby on Rails!
	About your application’s environment

## Step 2 - Create the Landing Page

### rails generate controller welcome index
	limingth@gmail ~/Github/myRoR/userhub$ rails generate controller welcome index
	      create  app/controllers/welcome_controller.rb
	       route  get "welcome/index"
	      invoke  erb
	      create    app/views/welcome
	      create    app/views/welcome/index.html.erb
	      invoke  test_unit
	      create    test/controllers/welcome_controller_test.rb
	      invoke  helper
	      create    app/helpers/welcome_helper.rb
	      invoke    test_unit
	      create      test/helpers/welcome_helper_test.rb
	      invoke  assets
	      invoke    coffee
	      create      app/assets/javascripts/welcome.js.coffee
	      invoke    scss
	      create      app/assets/stylesheets/welcome.css.scss
	limingth@gmail ~/Github/myRoR/userhub$ 

### open config/routes.rb and uncomment root routing
	limingth@gmail ~/Github/myRoR/userhub$ vi config/routes.rb 
	  1 Userhub::Application.routes.draw do
	  2   get "welcome/index"
	  3   # The priority is based upon order of creation: first created -> highest priority.
	  4   # See how all your routes lay out with "rake routes".
	  5 
	  6   # You can have the root of your site routed with "root"
	  7   root 'welcome#index'

### in web browser http://localhost:3000
	Welcome#index

	Find me in app/views/welcome/index.html.erb

### open app/views/welcome/index.html.erb
	limingth@gmail ~/Github/myRoR/userhub$ vi app/views/welcome/index.html.erb 
	  1 <h1>Welcome to UserHub</h1>
	  2 <p>User informations coming soon...</p>

### in web browser http://localhost:3000

	Welcome to UserHub

	User informations coming soon...

### git commit
	limingth@gmail ~/Github/myRoR/userhub$ git status
	# On branch master
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	../5-user-hub-project.md
	#	./
	nothing added to commit but untracked files present (use "git add" to track)
	limingth@gmail ~/Github/myRoR/userhub$ git add ../5-user-hub-project.md 
	limingth@gmail ~/Github/myRoR/userhub$ git add ./
	limingth@gmail ~/Github/myRoR/userhub$ git commit -a -m "Step 2 - Create the landing page"
	[master acfc7d5] Step 2 - Create the landing page
	 61 files changed, 1056 insertions(+)
	 create mode 100644 5-user-hub-project.md
	 create mode 100644 userhub/.gitignore
	 create mode 100644 userhub/Gemfile
	 create mode 100644 userhub/Gemfile.lock
	 create mode 100644 userhub/README.rdoc
	 create mode 100644 userhub/Rakefile
	 create mode 100644 userhub/app/assets/images/.keep
	 create mode 100644 userhub/app/assets/javascripts/application.js
	 create mode 100644 userhub/app/assets/javascripts/welcome.js.coffee
	 create mode 100644 userhub/app/assets/stylesheets/application.css
	 create mode 100644 userhub/app/assets/stylesheets/welcome.css.scss
	 create mode 100644 userhub/app/controllers/application_controller.rb
	 create mode 100644 userhub/app/controllers/concerns/.keep
	 create mode 100644 userhub/app/controllers/welcome_controller.rb
	 create mode 100644 userhub/app/helpers/application_helper.rb
	 create mode 100644 userhub/app/helpers/welcome_helper.rb
	 create mode 100644 userhub/app/mailers/.keep
	 create mode 100644 userhub/app/models/.keep
	 create mode 100644 userhub/app/models/concerns/.keep
	 create mode 100644 userhub/app/views/layouts/application.html.erb
	 create mode 100644 userhub/app/views/welcome/index.html.erb
	 create mode 100755 userhub/bin/bundle
	 create mode 100755 userhub/bin/rails
	 create mode 100755 userhub/bin/rake
	 create mode 100644 userhub/config.ru
	 create mode 100644 userhub/config/application.rb
	 create mode 100644 userhub/config/boot.rb
	 create mode 100644 userhub/config/database.yml
	 create mode 100644 userhub/config/environment.rb
	 create mode 100644 userhub/config/environments/development.rb
	 create mode 100644 userhub/config/environments/production.rb
	 create mode 100644 userhub/config/environments/test.rb
	 create mode 100644 userhub/config/initializers/backtrace_silencers.rb
	 create mode 100644 userhub/config/initializers/filter_parameter_logging.rb
	 create mode 100644 userhub/config/initializers/inflections.rb
	 create mode 100644 userhub/config/initializers/mime_types.rb
	 create mode 100644 userhub/config/initializers/secret_token.rb
	 create mode 100644 userhub/config/initializers/session_store.rb
	 create mode 100644 userhub/config/initializers/wrap_parameters.rb
	 create mode 100644 userhub/config/locales/en.yml
	 create mode 100644 userhub/config/routes.rb
	 create mode 100644 userhub/db/seeds.rb
	 create mode 100644 userhub/lib/assets/.keep
	 create mode 100644 userhub/lib/tasks/.keep
	 create mode 100644 userhub/log/.keep
	 create mode 100644 userhub/public/404.html
	 create mode 100644 userhub/public/422.html
	 create mode 100644 userhub/public/500.html
	 create mode 100644 userhub/public/favicon.ico
	 create mode 100644 userhub/public/robots.txt
	 create mode 100644 userhub/test/controllers/.keep
	 create mode 100644 userhub/test/controllers/welcome_controller_test.rb
	 create mode 100644 userhub/test/fixtures/.keep
	 create mode 100644 userhub/test/helpers/.keep
	 create mode 100644 userhub/test/helpers/welcome_helper_test.rb
	 create mode 100644 userhub/test/integration/.keep
	 create mode 100644 userhub/test/mailers/.keep
	 create mode 100644 userhub/test/models/.keep
	 create mode 100644 userhub/test/test_helper.rb
	 create mode 100644 userhub/vendor/assets/javascripts/.keep
	 create mode 100644 userhub/vendor/assets/stylesheets/.keep
	limingth@gmail ~/Github/myRoR/userhub$ git push
	Counting objects: 38, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (33/33), done.
	Writing objects: 100% (37/37), 11.85 KiB | 0 bytes/s, done.
	Total 37 (delta 1), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   c7439e2..acfc7d5  master -> master
	limingth@gmail ~/Github/myRoR/userhub$ 

## Step 3 - Enable pSQL and Create database

### modify Gemfile
	limingth@gmail ~/Github/myRoR/userhub$ vi Gemfile
	  1 source 'https://rubygems.org'
	  2 
	  3 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
	  4 gem 'rails', '4.0.1'
	  5 
	  6 # Use sqlite3 as the database for Active Record
	  7 #gem 'sqlite3'
	  8 gem 'pg'

### bundle install
	limingth@gmail ~/Github/myRoR/userhub$ bundle install
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
	Using mime-types (1.25.1) 
	Using polyglot (0.3.3) 
	Using treetop (1.4.15) 
	Using mail (2.5.4) 
	Using actionmailer (4.0.1) 
	Using activemodel (4.0.1) 
	Using activerecord-deprecated_finders (1.0.3) 
	Using arel (4.0.1) 
	Using activerecord (4.0.1) 
	Using bundler (1.3.5) 
	Using coffee-script-source (1.6.3) 
	Using execjs (2.0.2) 
	Using coffee-script (2.2.0) 
	Using thor (0.18.1) 
	Using railties (4.0.1) 
	Using coffee-rails (4.0.1) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Using pg (0.17.0) 
	Using tilt (1.4.1) 
	Using sprockets (2.10.1) 
	Using sprockets-rails (2.0.1) 
	Using rails (4.0.1) 
	Using rdoc (3.12.2) 
	Using sass (3.2.12) 
	Using sass-rails (4.0.1) 
	Using sdoc (0.3.20) 
	Using turbolinks (1.3.1) 
	Using uglifier (2.3.1) 
	Your bundle is complete!
	Use `bundle show [gemname]` to see where a bundled gem is installed.
	limingth@gmail ~/Github/myRoR/userhub$ 

### make sure using pSQL 9.3.1
	limingth@gmail ~/Github/myRoR/wikiful$ which psql
	/usr/bin/psql
	limingth@gmail ~/Github/myRoR/wikiful$ export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
	limingth@gmail ~/Github/myRoR/wikiful$ psql --version
	psql (PostgreSQL) 9.3.1
	limingth@gmail ~/Github/myRoR/wikiful$ which psql
	/Applications/Postgres93.app/Contents/MacOS/bin/psql
	limingth@gmail ~/Github/myRoR/wikiful$ 

### create user
	limingth@gmail ~/Github/myRoR/userhub$ createuser -s userhub

#### in case you encountered the error message like this
	createuser: could not connect to database postgres: could not connect to server: No such file or directory
		Is the server running locally and accepting
		connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?
	limingth@gmail ~/Github/myRoR/userhub$ 

#### check which createuser command you are using
	limingth@gmail ~/Github/myRoR/userhub$ which createuser
	/usr/bin/createuser
	limingth@gmail ~/Github/myRoR/userhub$ 

#### make user PATH is correct
	limingth@gmail ~/Github/myRoR/userhub$ export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
	limingth@gmail ~/Github/myRoR/userhub$ which createuser
	/Applications/Postgres93.app/Contents/MacOS/bin/createuser
	limingth@gmail ~/Github/myRoR/userhub$ 

### modify config/database.yml
	limingth@gmail ~/Github/myRoR/userhub$ vi config/database.yml 
	# SQLite version 3.x 
	#   gem install sqlite3
	#
	#   Ensure the SQLite 3 gem is defined in your Gemfile
	#   gem 'sqlite3'
	development:
	  adapter: postgresql
	  database: userhub_development
	  encoding: unicode
	  user: userhub
	  host: localhost
	  pool: 5
	  timeout: 5000

	# Warning: The database defined as "test" will be erased and 
	# re-generated from your development database when you run "rake".
	# Do not set this db to the same as development or production.
	test:
	  adapter: postgresql
	  database: userhub_test
	  encoding: unicode
	  user: userhub
	  host: localhost
	  pool: 5
	  timeout: 5000

	production:
	  adapter: postgresql
	  database: userhub_production
	  encoding: unicode
	  pool: 5
	  timeout: 5000

### verify the database is created
	limingth@gmail ~/Github/myRoR/userhub$ psql -d userhub_development
	psql: FATAL:  database "userhub_development" does not exist
	limingth@gmail ~/Github/myRoR/userhub$ rake db:create
	limingth@gmail ~/Github/myRoR/userhub$ psql -d userhub_development
	psql (9.3.1)
	Type "help" for help.

	userhub_development=# \q
	limingth@gmail ~/Github/myRoR/userhub$ 

### git commit
	limingth@gmail ~/Github/myRoR/userhub$ git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   ../2-work-with-psql.md
	#	modified:   ../5-user-hub-project.md
	#	modified:   Gemfile
	#	modified:   Gemfile.lock
	#	modified:   config/database.yml
	#
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/myRoR/userhub$ git commit -a -m "enable pSQL and create databse"
	[master 8ecfdb9] enable pSQL and create databse
	 5 files changed, 156 insertions(+), 12 deletions(-)
	limingth@gmail ~/Github/myRoR/userhub$ git push
	Counting objects: 17, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (9/9), done.
	Writing objects: 100% (9/9), 1.89 KiB | 0 bytes/s, done.
	Total 9 (delta 8), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   595c4c3..8ecfdb9  master -> master
	limingth@gmail ~/Github/myRoR/userhub$ 

## Step 4 - Modeling Students, Majors and Users for stuhub

### create Student model
	limingth@gmail ~/Github/myRoR/userhub$ rails generate model Student name:string email:text
	      invoke  active_record
	      create    db/migrate/20131128173148_create_students.rb
	      create    app/models/student.rb
	      invoke    test_unit
	      create      test/models/student_test.rb
	      create      test/fixtures/students.yml
	limingth@gmail ~/Github/myRoR/userhub$ 

### create user model
	limingth@gmail ~/Github/myRoR/userhub$ vi app/models/student.rb 
	  1 class Student < ActiveRecord::Base
	  2 belongs_to :user
	  3 end

### add validates
	limingth@gmail ~/Github/myRoR/userhub$ vi app/models/student.rb 
	  1 class Student < ActiveRecord::Base
	  2 belongs_to :user
	  3 validates :name, presence: true
	  4 validates :email, presence: true
	  5 end

### migrate model
	limingth@gmail ~/Github/myRoR/userhub$ rake db:migrate
	==  CreateStudents: migrating =================================================
	-- create_table(:students)
	   -> 0.0314s
	==  CreateStudents: migrated (0.0320s) ========================================

	limingth@gmail ~/Github/myRoR/userhub$ 

### check database in rails console
	limingth@gmail ~/Github/myRoR/userhub$ rails c
	Loading development environment (Rails 4.0.1)
	2.0.0-p247 :001 > Student
	 => Student(no database connection) 
	2.0.0-p247 :002 > Student.count
	   (1.1ms)  SELECT COUNT(*) FROM "students"
	 => 0 
	2.0.0-p247 :003 > Student.first
	  Student Load (2.3ms)  SELECT "students".* FROM "students" ORDER BY "students"."id" ASC LIMIT 1
	 => nil 
	2.0.0-p247 :004 > 

### add first record in database
	2.0.0-p247 :004 > a = Student.new(name:"li ming", email:"limingth@gmail.com")
	 => #<Student id: nil, name: "li ming", email: "limingth@gmail.com", created_at: nil, updated_at: nil> 
	2.0.0-p247 :005 > a.save
	   (0.8ms)  BEGIN
	  SQL (12.8ms)  INSERT INTO "students" ("created_at", "email", "name", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["created_at", Thu, 28 Nov 2013 17:37:33 UTC +00:00], ["email", "limingth@gmail.com"], ["name", "li ming"], ["updated_at", Thu, 28 Nov 2013 17:37:33 UTC +00:00]]
	   (0.9ms)  COMMIT
	 => true 
	2.0.0-p247 :006 > Student
	 => Student(id: integer, name: string, email: text, created_at: datetime, updated_at: datetime) 
	2.0.0-p247 :007 > Student.count
	   (1.6ms)  SELECT COUNT(*) FROM "students"
	 => 1 
	2.0.0-p247 :008 > Student.first
	  Student Load (1.7ms)  SELECT "students".* FROM "students" ORDER BY "students"."id" ASC LIMIT 1
	 => #<Student id: 1, name: "li ming", email: "limingth@gmail.com", created_at: "2013-11-28 17:37:33", updated_at: "2013-11-28 17:37:33"> 
	2.0.0-p247 :009 > Student.last
	  Student Load (1.5ms)  SELECT "students".* FROM "students" ORDER BY "students"."id" DESC LIMIT 1
	 => #<Student id: 1, name: "li ming", email: "limingth@gmail.com", created_at: "2013-11-28 17:37:33", updated_at: "2013-11-28 17:37:33"> 
	2.0.0-p247 :010 > 

### git commit










