# Twetter Project

## Fork the Twetter Repository

### Fork the repo
<https://github.com/Thinkful/twetter>

### git clone 
	limingth@gmail ~/Github/myRoR$ git clone https://github.com/limingth/twetter
	Cloning into 'twetter'...
	remote: Counting objects: 730, done.
	remote: Compressing objects: 100% (277/277), done.
	remote: Total 730 (delta 420), reused 719 (delta 409)
	Receiving objects: 100% (730/730), 265.09 KiB | 200.00 KiB/s, done.
	Resolving deltas: 100% (420/420), done.
	Checking connectivity... done
	limingth@gmail ~/Github/myRoR$ 

### get a list of the remote branches
	limingth@gmail ~/Github/myRoR$ git branch -r
	  origin/HEAD -> origin/master
	  origin/gh-pages
	  origin/master
	limingth@gmail ~/Github/myRoR$ 

### Navigate to Twetter
	limingth@gmail ~/Github/myRoR$ cd twetter/
	RVM used your Gemfile for selecting Ruby, it is all fine - Heroku does that too,
	you can ignore these warnings with 'rvm rvmrc warning ignore /Users/limingth/Github/myRoR/twetter/Gemfile'.
	To ignore the warning for all files run 'rvm rvmrc warning ignore allGemfiles'.

	limingth@gmail ~/Github/myRoR/twetter$ 

### Install the required gems 
	limingth@gmail ~/Github/myRoR/twetter$ bundle install
	Fetching gem metadata from https://rubygems.org/.........
	Fetching gem metadata from https://rubygems.org/..
	Using rake (10.1.0) 
	Using i18n (0.6.5) 
	Using minitest (4.7.5) 
	Using multi_json (1.8.2) 
	Using atomic (1.1.14) 
	Using thread_safe (0.1.3) 
	Using tzinfo (0.3.38) 
	Installing activesupport (4.0.0) 
	Using builder (3.1.4) 
	Using erubis (2.7.0) 
	Using rack (1.5.2) 
	Using rack-test (0.6.2) 
	Installing actionpack (4.0.0) 
	Using mime-types (1.25) 
	Using polyglot (0.3.3) 
	Using treetop (1.4.15) 
	Using mail (2.5.4) 
	Installing actionmailer (4.0.0) 
	Installing activemodel (4.0.0) 
	Using activerecord-deprecated_finders (1.0.3) 
	Using arel (4.0.1) 
	Installing activerecord (4.0.0) 
	Using bcrypt-ruby (3.1.2) 
	Using sass (3.2.12) 
	Installing bootstrap-sass (3.0.0.0.rc2) 
	Using coffee-script-source (1.6.3) 
	Using execjs (2.0.2) 
	Using coffee-script (2.2.0) 
	Using thor (0.18.1) 
	Installing railties (4.0.0) 
	Using coffee-rails (4.0.1) 
	Installing orm_adapter (0.4.0) 
	Installing warden (1.2.3) 
	Installing devise (3.1.1) 
	Installing diff-lcs (1.2.4) 
	Installing factory_girl (4.2.0) 
	Installing factory_girl_rails (4.2.1) 
	Installing ffaker (1.20.0) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Using libv8 (3.16.14.3) 
	Using bundler (1.3.5) 
	Using tilt (1.4.1) 
	Using sprockets (2.10.0) 
	Using sprockets-rails (2.0.1) 
	Installing rails (4.0.0) 
	Using rdoc (3.12.2) 
	Using ref (1.0.5) 
	Installing rspec-core (2.14.6) 
	Installing rspec-expectations (2.14.3) 
	Installing rspec-mocks (2.14.4) 
	Installing rspec-rails (2.14.0) 
	Using sass-rails (4.0.1) 
	Using sdoc (0.3.20) 
	Installing shoulda-matchers (2.4.0) 
	Using sqlite3 (1.3.8) 
	Using therubyracer (0.12.0) 
	Using turbolinks (1.3.0) 
	Installing uglifier (2.3.0) 
	Your bundle is complete!
	Use `bundle show [gemname]` to see where a bundled gem is installed.
	limingth@gmail ~/Github/myRoR/twetter$ 

### take a look at the .gitignore file 
	limingth@gmail ~/Github/myRoR/twetter$ cat .gitignore 
	  1 *.rbc
	  2 *.sassc
	  3 .sass-cache
	  4 capybara-*.html
	  5 .rspec
	  6 .rvmrc
	  7 /.bundle
	  8 /vendor/bundle
	  9 /log/*
	 10 /tmp/*
	 11 /db/*.sqlite3
	 12 /public/system/*
	 13 /coverage/
	 14 /spec/tmp/*
	 15 **.orig
	 16 rerun.txt
	 17 pickle-email-*.html
	 18 .project
	 19 config/initializers/secret_token.rb  <--- see here
	 20 .DS_Store

### create the appropriate file
	limingth@gmail ~/Github/myRoR/twetter$ echo "Twetter::Application.config.secret_key_base = '`bundle exec rake secret`'" > config/initializers/secret_token.rb
	limingth@gmail ~/Github/myRoR/twetter$ cat config/initializers/secret_token.rb
	Twetter::Application.config.secret_key_base = '048de940e47baed979595f46fea6715a75b901509a3ac797c2a308624c0f4bea5fd3baa2c951dbc652debf7f9ed8d8dbd40ba5513457c52be8153fffeb73af60'

* see that it sets a property on your Twetter application. config.secret_key_base is set to a randomly generated string.

### Set Up Your Database and Migrate Your Models
	limingth@gmail ~/Github/myRoR/twetter$ bundle exec rake db:create db:migrate db:test:prepare
	==  DeviseCreateUsers: migrating ==============================================
	-- create_table(:users)
	   -> 0.0101s
	-- add_index(:users, :email, {:unique=>true})
	   -> 0.0016s
	-- add_index(:users, :reset_password_token, {:unique=>true})
	   -> 0.0013s
	-- add_index(:users, :unlock_token, {:unique=>true})
	   -> 0.0012s
	==  DeviseCreateUsers: migrated (0.0147s) =====================================

	==  AddNameToUsers: migrating =================================================
	-- add_column(:users, :name, :string)
	   -> 0.0015s
	==  AddNameToUsers: migrated (0.0017s) ========================================

	==  AddUsernameToUsers: migrating =============================================
	-- add_column(:users, :username, :string)
	   -> 0.0017s
	==  AddUsernameToUsers: migrated (0.0023s) ====================================

	==  CreateFollows: migrating ==================================================
	-- create_table(:follows)
	   -> 0.0023s
	==  CreateFollows: migrated (0.0029s) =========================================

	==  CreateTweets: migrating ===================================================
	-- create_table(:tweets)
	   -> 0.0019s
	-- add_index(:tweets, :user_id)
	   -> 0.0009s
	==  CreateTweets: migrated (0.0030s) ==========================================

	==  AddIndeciesToFollows: migrating ===========================================
	-- add_index(:follows, [:user_id, :following_id])
	   -> 0.0015s
	==  AddIndeciesToFollows: migrated (0.0020s) ==================================

	==  ChangeTweetToTwet: migrating ==============================================
	==  ChangeTweetToTwet: migrated (0.0023s) =====================================

	limingth@gmail ~/Github/myRoR/twetter$ 

### Seed Your Data
	limingth@gmail ~/Github/myRoR/twetter$ bundle exec rake seed:users
	limingth@gmail ~/Github/myRoR/twetter$ bundle exec rake seed:twets
	limingth@gmail ~/Github/myRoR/twetter$ 

### Start the Server
	limingth@gmail ~/Github/myRoR/twetter$ bundle exec rails s
	=> Booting WEBrick
	=> Rails 4.0.0 application starting in development on http://0.0.0.0:3000
	=> Run `rails server -h` for more startup options
	=> Ctrl-C to shutdown server
	[2013-12-12 12:28:27] INFO  WEBrick 1.3.1
	[2013-12-12 12:28:27] INFO  ruby 2.0.0 (2013-06-27) [x86_64-darwin12.4.0]
	[2013-12-12 12:28:27] INFO  WEBrick::HTTPServer#start: pid=21245 port=3000

### Visit Twetter
* In your browser of choice, go to localhost:3000

![the index page for Twetter](twetter-homepage.png)

* after you sign up your account, you can see this page

![your account page after sign-up](twetter-account.png)


* if you follow other users, there’s a message that flashes in the center of the navbar.

![a message flashes](twetter-follow.png)

### Do yourself
* Try to dismiss flashed messages by clicking the “Dismiss message” link in the rightside of navbar.


## Get to Know the Twetter Code Base

### Get a Quick Overview of Your Routes
	limingth@gmail ~/Github/myRoR$ cd twetter
	RVM used your Gemfile for selecting Ruby, it is all fine - Heroku does that too,
	you can ignore these warnings with 'rvm rvmrc warning ignore /Users/limingth/Github/myRoR/twetter/Gemfile'.
	To ignore the warning for all files run 'rvm rvmrc warning ignore allGemfiles'.

	limingth@gmail ~/Github/myRoR/twetter$ rake routes
	                  Prefix Verb   URI Pattern                    Controller#Action
	        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
	            user_session POST   /users/sign_in(.:format)       devise/sessions#create
	    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
	           user_password POST   /users/password(.:format)      devise/passwords#create
	       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
	      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
	                         PATCH  /users/password(.:format)      devise/passwords#update
	                         PUT    /users/password(.:format)      devise/passwords#update
	cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
	       user_registration POST   /users(.:format)               devise/registrations#create
	   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
	  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
	                         PATCH  /users(.:format)               devise/registrations#update
	                         PUT    /users(.:format)               devise/registrations#update
	                         DELETE /users(.:format)               devise/registrations#destroy
	             user_unlock POST   /users/unlock(.:format)        devise/unlocks#create
	         new_user_unlock GET    /users/unlock/new(.:format)    devise/unlocks#new
	                         GET    /users/unlock(.:format)        devise/unlocks#show
	                 follows GET    /follows(.:format)             follows#index
	                         POST   /follows(.:format)             follows#create
	                  follow DELETE /follows/:id(.:format)         follows#destroy
	                   twets GET    /twets(.:format)               twets#index
	                         POST   /twets(.:format)               twets#create
	                    twet DELETE /twets/:id(.:format)           twets#destroy
	               user_root GET    /                              follows#index
	                    root GET    /                              home#index
	limingth@gmail ~/Github/myRoR/twetter$ 

#### Look at the 3rd from the bottom row. 

	twets GET    /twets(.:format)              twets#index

* The url prefix for this view is “twets”. When this endpoint is accessed with the GET method, it returns the index action on our twets controller (twetter/app/controllers/twets_controllers).

### Take a Guided Tour
* Make sure to pay special attention to the following items below: 
	- controllers, 
	- models, 
	- views, 
	- and config/routes.rb.

#### The App Folder
When you’re building out features for your app, much of the work will take place in the apps folder.

* Assets: This folder houses static files your app requires
	- images, 
	- javascript (find several auto-generated files)
	- and stylesheets (see style.css file)

* Builders: This directory contains custom form builders
	- just have one -- InlineErrorsBuilder
	- 

#### hands-on
	limingth@gmail ~/Github/myRoR/twetter$ open app/assets/images/twetter-logo.png 

	limingth@gmail ~/Github/myRoR/twetter$ ls app/assets/javascripts/
	application.js		follows.js.coffee	home.js.coffee		twets.js.coffee

	limingth@gmail ~/Github/myRoR/twetter$ more app/assets/stylesheets/style.css 
	body {
	  background-attachment: scroll;
	  background-clip: border-box;
	  background-color: rgba(0, 0, 0, 0);
	  background-image: -webkit-radial-gradient(center, circle cover, rgb(148, 210, 248), rgb(58, 146, 200));
	  background-origin: padding-box;
	  background-size: auto;
	  color: rgb(51, 51, 51);
	 ...

	limingth@gmail ~/Github/myRoR/twetter$ ls app/builders/
	inline_errors_builder.rb
	limingth@gmail ~/Github/myRoR/twetter$ 

	limingth@gmail ~/Github/myRoR/twetter$ cat app/builders/inline_errors_builder.rb 
	# more info: http://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html
	#
	# This class inherits from the default FormBuilder class and adds two public methods
	# for displaying errors related to specific fields.
	#
	class InlineErrorsBuilder < ActionView::Helpers::FormBuilder

	  # Generates HTML for displaying errors related to the attribute passed as 'meth'
	  #
	  def errors_for(meth, options = {})
	    @template.content_tag :p, @object.errors[meth].join('<br>').html_safe, :class => 'help-block' if has_errors?(meth)
	  end

	  # Adds the 'has-error' class to the list of other classes passed if there are
	  # errors on the attribute passed as 'meth'
	  #
	  def validation_class(meth, *klasses)
	    klasses << 'has-error' if has_errors?(meth)
	    klasses.compact.join(' ').html_safe
	  end

	  private

	  # Determines if there are errors on the attribute passed as 'meth'. Includes protection
	  # against edge cases where there is no object present.
	  #
	  def has_errors?(meth)
	    @object.present? ? @object.errors[meth].present? : false
	  end
	end
	limingth@gmail ~/Github/myRoR/twetter$ 

### 



















