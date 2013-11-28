
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

## Step 3 - 





