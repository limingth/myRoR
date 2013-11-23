# the Wikiful project hands-on

## Create the Wikiful Rails App

### rvm use ruby-2.0.0
      limingth@gmail ~/Github/myRoR/wikiful$ rvm use ruby-2.0.0
      Using /Users/limingth/.rvm/gems/ruby-2.0.0-p247

### rvm gemset list
      limingth@gmail ~/Github/myRoR/wikiful$ rvm gemset list

      gemsets for ruby-2.0.0-p247 (found in /Users/limingth/.rvm/gems/ruby-2.0.0-p247)
      => (default)
         global
         wikful
         wikiful

### rvm gemset use wikiful        
      limingth@gmail ~/Github/myRoR/wikiful$ rvm gemset use wikiful     
      Using ruby-2.0.0-p247 with gemset wikiful
      limingth@gmail ~/Github/myRoR/wikiful$ rvm gemset list

      gemsets for ruby-2.0.0-p247 (found in /Users/limingth/.rvm/gems/ruby-2.0.0-p247)
         (default)
         global
         wikful
      => wikiful

### rails new wikiful
      limingth@gmail ~/Github/myRoR$ rails new wikiful
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
      Using mime-types (1.25) 
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
      Using sprockets (2.10.0) 
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

### ls
      limingth@gmail ~/Github/myRoR$ ls -l wikiful/ 
      total 40
      -rw-r--r--   1 limingth  staff  1176 11 22 16:31 Gemfile
      -rw-r--r--   1 limingth  staff  2715 11 22 16:31 Gemfile.lock
      -rw-r--r--   1 limingth  staff   478 11 22 16:31 README.rdoc
      -rw-r--r--   1 limingth  staff   252 11 22 16:31 Rakefile
      drwxr-xr-x   8 limingth  staff   272 11 22 16:31 app
      drwxr-xr-x   5 limingth  staff   170 11 22 16:31 bin
      drwxr-xr-x  10 limingth  staff   340 11 22 16:31 config
      -rw-r--r--   1 limingth  staff   154 11 22 16:31 config.ru
      drwxr-xr-x   3 limingth  staff   102 11 22 16:31 db
      drwxr-xr-x   4 limingth  staff   136 11 22 16:31 lib
      drwxr-xr-x   3 limingth  staff   102 11 22 16:31 log
      drwxr-xr-x   7 limingth  staff   238 11 22 16:31 public
      drwxr-xr-x   9 limingth  staff   306 11 22 16:31 test
      drwxr-xr-x   3 limingth  staff   102 11 22 16:31 tmp
      drwxr-xr-x   3 limingth  staff   102 11 22 16:31 vendor
      limingth@gmail ~/Github/myRoR$ 

### rails 
      limingth@gmail ~/Github/myRoR/wikiful$ rails s
      => Booting WEBrick
      => Rails 4.0.1 application starting in development on http://0.0.0.0:3000
      => Run `rails server -h` for more startup options
      => Ctrl-C to shutdown server
      [2013-11-22 16:33:21] INFO  WEBrick 1.3.1
      [2013-11-22 16:33:21] INFO  ruby 2.0.0 (2013-06-27) [x86_64-darwin12.4.0]
      [2013-11-22 16:33:21] INFO  WEBrick::HTTPServer#start: pid=58312 port=3000

### web browser
      Welcome aboard
      You’re riding Ruby on Rails!
      About your application’s environment

      Getting started
      Here’s how to get rolling:

      Use rails generate to create your models and controllers
      To see all available options, run it without parameters.

      Set up a root route to replace this page
      You're seeing this page because you're running in development mode and you haven't set a root route yet.

      Routes are set up in config/routes.rb.

      Configure your database
      If you're not using SQLite (the default), edit config/database.yml with your username and password.

### rails generate controller welcome index
      limingth@gmail ~/Github/myRoR/wikiful$ rails generate controller welcome index
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
      limingth@gmail ~/Github/myRoR/wikiful$ 

## Create the Wikiful Landing Page

### open file config/routes.rb
      Wikiful::Application.routes.draw do
        # The priority is based upon order of creation: first created -> highest priority.
        # See how all your routes lay out with "rake routes".

        # You can have the root of your site routed with "root"
        root 'welcome#index'

### web browser localhost:3000
      Routing Error
      uninitialized constant WelcomeController

      Rails.root: /Users/limingth/Github/myRoR/wikiful

      Application Trace | Framework Trace | Full Trace
      Routes

      Routes match in priority from top to bottom

### git status
      limingth@gmail ~/Github/myRoR$ git status
      # On branch master
      # Changes not staged for commit:
      #   (use "git add <file>..." to update what will be committed)
      #   (use "git checkout -- <file>..." to discard changes in working directory)
      #
      #     modified:   wikiful/config/initializers/secret_token.rb
      #     modified:   wikiful/config/routes.rb

### rails generate controller welcome index
      limingth@gmail ~/Github/myRoR$ cd wikiful/
      limingth@gmail ~/Github/myRoR/wikiful$ ls
      Gemfile           Rakefile    config            lib         test
      Gemfile.lock      app         config.ru   log         tmp
      README.rdoc bin         db          public            vendor
      limingth@gmail ~/Github/myRoR/wikiful$ rails generate controller welcome index
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
      limingth@gmail ~/Github/myRoR/wikiful$       

### git status
      limingth@gmail ~/Github/myRoR/wikiful$ git status
      # On branch master
      # Changes not staged for commit:
      #   (use "git add <file>..." to update what will be committed)
      #   (use "git checkout -- <file>..." to discard changes in working directory)
      #
      #     modified:   config/initializers/secret_token.rb
      #     modified:   config/routes.rb
      #
      # Untracked files:
      #   (use "git add <file>..." to include in what will be committed)
      #
      #     app/assets/javascripts/welcome.js.coffee
      #     app/assets/stylesheets/welcome.css.scss
      #     app/controllers/welcome_controller.rb
      #     app/helpers/welcome_helper.rb
      #     app/views/welcome/
      #     test/controllers/welcome_controller_test.rb
      #     test/helpers/welcome_helper_test.rb
      no changes added to commit (use "git add" and/or "git commit -a")
      limingth@gmail ~/Github/myRoR/wikiful$ 

### Web browser localhost:3000
      Welcome#index

      Find me in app/views/welcome/index.html.erb   

### Check app/views/welcome/index.html.erb
      limingth@gmail ~/Github/myRoR/wikiful$ ls app/views/welcome/index.html.erb
      app/views/welcome/index.html.erb
      limingth@gmail ~/Github/myRoR/wikiful$ cat app/views/welcome/index.html.erb
      <h1>Welcome#index</h1>
      <p>Find me in app/views/welcome/index.html.erb</p>
      limingth@gmail ~/Github/myRoR/wikiful$ 

### open app/views/welcome/index.html.erb
      limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/welcome/index.html.erb
      limingth@gmail ~/Github/myRoR/wikiful$ cat app/views/welcome/index.html.erb
      <h1>Welcome to Wikiful</h1>
      <p>This is a placeholder for our landing page. Eventually we'll put something cooler here!</p>

### Web browser localhost:3000
      Welcome to Wikiful

      This is a placeholder for our landing page. Eventually we'll put something cooler here!

## Push Your Local Repository up to Github
      limingth@gmail ~/Github/myRoR/wikiful$ git status
      # On branch master
      # Changes not staged for commit:
      #   (use "git add <file>..." to update what will be committed)
      #   (use "git checkout -- <file>..." to discard changes in working directory)
      #
      #     modified:   config/initializers/secret_token.rb
      #     modified:   config/routes.rb
      #
      # Untracked files:
      #   (use "git add <file>..." to include in what will be committed)
      #
      #     ../1-build-project-wikiful
      #     app/assets/javascripts/welcome.js.coffee
      #     app/assets/stylesheets/welcome.css.scss
      #     app/controllers/welcome_controller.rb
      #     app/helpers/welcome_helper.rb
      #     app/views/welcome/
      #     test/controllers/welcome_controller_test.rb
      #     test/helpers/welcome_helper_test.rb
      no changes added to commit (use "git add" and/or "git commit -a")
      
      limingth@gmail ~/Github/myRoR/wikiful$ 
      limingth@gmail ~/Github/myRoR/wikiful$ git add .
      limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "change homepage"
      [master 8bf7c45] change homepage
       9 files changed, 32 insertions(+), 2 deletions(-)
       create mode 100644 wikiful/app/assets/javascripts/welcome.js.coffee
       create mode 100644 wikiful/app/assets/stylesheets/welcome.css.scss
       create mode 100644 wikiful/app/controllers/welcome_controller.rb
       create mode 100644 wikiful/app/helpers/welcome_helper.rb
       create mode 100644 wikiful/app/views/welcome/index.html.erb
       create mode 100644 wikiful/test/controllers/welcome_controller_test.rb
       create mode 100644 wikiful/test/helpers/welcome_helper_test.rb
      limingth@gmail ~/Github/myRoR/wikiful$ git push
      Counting objects: 40, done.
      Delta compression using up to 2 threads.
      Compressing objects: 100% (23/23), done.
      Writing objects: 100% (25/25), 2.51 KiB | 0 bytes/s, done.
      Total 25 (delta 7), reused 0 (delta 0)
      To git@github.com:limingth/myRoR.git
         5a208f9..8bf7c45  master -> master
      limingth@gmail ~/Github/myRoR/wikiful$ 
