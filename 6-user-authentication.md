
# User Authentication

## Create the User Model and Sign Up Flow

### create the user model
	limingth@gmail ~/Github/myRoR$ cd wikiful
	limingth@gmail ~/Github/myRoR/wikiful$ rails g resource user email name password_digest
	      invoke  active_record
	      create    db/migrate/20131203190743_create_users.rb
	      create    app/models/user.rb
	      invoke    test_unit
	      create      test/models/user_test.rb
	      create      test/fixtures/users.yml
	      invoke  controller
	      create    app/controllers/users_controller.rb
	      invoke    erb
	      create      app/views/users
	      invoke    test_unit
	      create      test/controllers/users_controller_test.rb
	      invoke    helper
	      create      app/helpers/users_helper.rb
	      invoke      test_unit
	      create        test/helpers/users_helper_test.rb
	      invoke    assets
	      invoke      coffee
	      create        app/assets/javascripts/users.js.coffee
	      invoke      scss
	      create        app/assets/stylesheets/users.css.scss
	      invoke  resource_route
	       route    resources :users
	limingth@gmail ~/Github/myRoR/wikiful$ 

#### vi db/migrate/20131203190743_create_users.rb
	limingth@gmail ~/Github/myRoR/wikiful$ vi db/migrate/20131203190743_create_users.rb 
	  1 class CreateUsers < ActiveRecord::Migration
	  2   def change
	  3     create_table :users do |t|
	  4       t.string :email
	  5       t.string :name
	  6       t.string :password_digest
	  7 
	  8       t.timestamps
	  9     end
	 10   end
	 11 end

#### vi app/models/user.rb 
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/models/user.rb 
	  1 class User < ActiveRecord::Base
	  2 end

#### ls app/views/users/
	limingth@gmail ~/Github/myRoR/wikiful$ ls app/views/users/
	limingth@gmail ~/Github/myRoR/wikiful$ 

#### vi app/controllers/users_controller.rb 
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/users_controller.rb 
	  1 class UsersController < ApplicationController
	  2 end
 
### update the database 
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:migrate
	==  CreateUsers: migrating ====================================================
	-- create_table(:users)
	   -> 0.0758s
	==  CreateUsers: migrated (0.0760s) ===========================================

	limingth@gmail ~/Github/myRoR/wikiful$ 

### using the Ruby gem bcrypt 
	limingth@gmail ~/Github/myRoR/wikiful$ vi Gemfile
	 35 
	 36 # Use ActiveModel has_secure_password
	 37 gem 'bcrypt-ruby', '~> 3.1.2'
	 38 

### run bundle install
	limingth@gmail ~/Github/myRoR/wikiful$ bundle install
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
	Installing bcrypt-ruby (3.1.2) 
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
	limingth@gmail ~/Github/myRoR/wikiful$ 

### open app/models/user.rb
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/models/user.rb 
	  1 class User < ActiveRecord::Base
	  2   has_secure_password
	  3   has_many :articles
	  4   validates_uniqueness_of :email
	  5   validates :name, presence: true
	  6   validates :email, presence: true
	  7 
	  8 end

### make sure article.rb belongs_to user
	limingth@gmail ~/Github/myRoR/wikiful$ cat app/models/article.rb 
	class Article < ActiveRecord::Base
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories
	validates :title, presence: true
	validates :content, presence: true
	validates :categories, presence: true
	end
	limingth@gmail ~/Github/myRoR/wikiful$ 

### add a new and create method to UsersController
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/users_controller.rb 
	  1 class UsersController < ApplicationController
	  2 
	  3   def new
	  4     @user = User.new
	  5   end
	  6 
	  7   def create
	  8     @user = User.new(user_params)
	  9     if @user.save
	 10       redirect_to root_url, notice: "Thank you for signing up"
	 11     else
	 12       render "new"
	 13     end
	 14   end
	 15 
	 16   private 
	 17     def user_params
	 18       params.require(:user).permit(:email, :name, :password, :password_confirmation)
	 19     end
	 20 
	 21 end

### Open up app/views/layouts/application.html.erb
	 22 <div class="container">
	 23   <div class="row">
	 24     <div class="span9"><%= yield %></div>
	 25     
	 26         <div class="span3 sidebar">
	 27           <div class="my-wiki-site">
	 28             <h4>My Wikiful</h4>
	 29             <ul>
	 30               <li><%= link_to "Write a Wiki", new_article_path %></li>
	 31             </ul>
	 32           </div>
	 33           
	 34         <div class="row">
	 35           <div class="span4">
	 36             <% flash.each do |name, msg| %>
	 37               <%= content_tag :div, msg, id: "flash_#{name}" %>
	 38             <% end %>
	 39           </div>
	 40         </div>
	 41 
	 42           <div class="categories-sidebar">
	 43             <h4>Categories</h4>
	 44             <ul> 
	 45               <% @categories.each do |category| %>
	 46                 <li><%= link_to category.name, category %></li>
	 47               <% end %>
	 48             </ul>
	 49           </div>

### create the sign up form
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/users/new.html.erb
	<h1>Sign Up</h1>

	<%= form_for @user do |f| %>
	  <% if @user.errors.any? %>
	    <div class="error_messages">
	      <h2>Form is invalid</h2>
	      <ul>
	        <% @user.errors.full_messages.each do |message| %>
	          <li><%= message %></li>
	        <% end %>
	      </ul>
	    </div>
	  <% end %>
	  <div class="field">
	    <%= f.label :name %>
	    <%= f.text_field :name %> 
	  </div>
	  <div class="field">
	    <%= f.label :email %>
	    <%= f.text_field :email %> 
	  </div>
	  <div class="field">
	    <%= f.label :password %>
	    <%= f.password_field :password %> 
	  </div>
	  <div class="field">
	    <%= f.label :password_confirmation %>
	    <%= f.password_field :password_confirmation %> 
	  </div>
	  <div class="actions"><%= f.submit %></div>
	<% end %>

### tell our routes.rb file 
	limingth@gmail ~/Github/myRoR/wikiful$ vi config/routes.rb 
	  1 Wikiful::Application.routes.draw do
	  2   resources :users
	  3 

### start rails server
	limingth@gmail ~/Github/myRoR/wikiful$ rails s
	=> Booting WEBrick
	=> Rails 4.0.1 application starting in development on http://0.0.0.0:3000
	=> Run `rails server -h` for more startup options
	=> Ctrl-C to shutdown server
	[2013-12-03 14:49:14] INFO  WEBrick 1.3.1
	[2013-12-03 14:49:14] INFO  ruby 2.0.0 (2013-06-27) [x86_64-darwin12.4.0]
	[2013-12-03 14:49:14] INFO  WEBrick::HTTPServer#start: pid=52837 port=3000

### open localhost:3000/users/new 
	You can see a form with user name, email, password, confirm password 
	fill the boxes, and submit it

### see the flash message
	My Wikiful

	* Write a Wiki
	Thank you for signing up

### git commit
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   ../6-user-authentication.md
	#	modified:   Gemfile
	#	modified:   Gemfile.lock
	#	modified:   app/views/layouts/application.html.erb
	#	modified:   config/routes.rb
	#	modified:   db/schema.rb
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	app/assets/javascripts/users.js.coffee
	#	app/assets/stylesheets/users.css.scss
	#	app/controllers/users_controller.rb
	#	app/helpers/users_helper.rb
	#	app/models/user.rb
	#	app/views/users/
	#	db/migrate/20131203190743_create_users.rb
	#	test/controllers/users_controller_test.rb
	#	test/fixtures/users.yml
	#	test/helpers/users_helper_test.rb
	#	test/models/user_test.rb
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/myRoR/wikiful$ git add .
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "add user auth."
	[master 9242cee] add user auth.
	 17 files changed, 427 insertions(+), 3 deletions(-)
	 create mode 100644 wikiful/app/assets/javascripts/users.js.coffee
	 create mode 100644 wikiful/app/assets/stylesheets/users.css.scss
	 create mode 100644 wikiful/app/controllers/users_controller.rb
	 create mode 100644 wikiful/app/helpers/users_helper.rb
	 create mode 100644 wikiful/app/models/user.rb
	 create mode 100644 wikiful/app/views/users/new.html.erb
	 create mode 100644 wikiful/db/migrate/20131203190743_create_users.rb
	 create mode 100644 wikiful/test/controllers/users_controller_test.rb
	 create mode 100644 wikiful/test/fixtures/users.yml
	 create mode 100644 wikiful/test/helpers/users_helper_test.rb
	 create mode 100644 wikiful/test/models/user_test.rb
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 62, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (34/34), done.
	Writing objects: 100% (37/37), 6.55 KiB | 0 bytes/s, done.
	Total 37 (delta 16), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   34101ce..9242cee  master -> master
	limingth@gmail ~/Github/myRoR/wikiful$ 


## Create Sessions, Login/Logout, and Authorization Flow

### create a SessionsController with a new action
	limingth@gmail ~/Github/myRoR/wikiful$ rails g controller sessions new
	      create  app/controllers/sessions_controller.rb
	       route  get "sessions/new"
	      invoke  erb
	      create    app/views/sessions
	      create    app/views/sessions/new.html.erb
	      invoke  test_unit
	      create    test/controllers/sessions_controller_test.rb
	      invoke  helper
	      create    app/helpers/sessions_helper.rb
	      invoke    test_unit
	      create      test/helpers/sessions_helper_test.rb
	      invoke  assets
	      invoke    coffee
	      create      app/assets/javascripts/sessions.js.coffee
	      invoke    scss
	      create      app/assets/stylesheets/sessions.css.scss
	limingth@gmail ~/Github/myRoR/wikiful$ 

### take a look at routes.rb 
	limingth@gmail ~/Github/myRoR/wikiful$ cat config/routes.rb 
	Wikiful::Application.routes.draw do
	  get "sessions/new"
	  resources :users

*  Note how rails added get "sessions/new".

### change routes.rb so sessions is configured as a resource
	limingth@gmail ~/Github/myRoR/wikiful$ vi config/routes.rb 
	  1 Wikiful::Application.routes.draw do
	  2   #get "sessions/new"
	  3   resources :sessions
	  4   resources :users

### create a view for starting a new session 
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/sessions/new.html.erb
	  1 <h1>Sessions#new</h1>
	  2 <p>Find me in app/views/sessions/new.html.erb</p>
	  3 
	  4 <h1>Login</h1>
	  5 
	  6 <%= form_tag sessions_path do %>
	  7   <div class="field">
	  8     <%= label_tag :email %><br>
	  9     <%= text_field_tag :email, params[:email]%> 
	 10   </div>
	 11   <div class="field">
	 12     <%= label_tag :password %><br>
	 13     <%= text_field_tag :password, params[:password], :type => "password" %> 
	 14   </div>
	 15   <div class="actions"><%= submit_tag "Log In" %></div>
	 16 <% end %>

### Open SessionsController 
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/sessions_controller.rb 
	  1 class SessionsController < ApplicationController
	  2   def new
	  3   end
	  4 
	  5   def create
	  6     user = User.find_by_email(params[:email])
	  7     if user && user.authenticate(params[:password]) # get this for free from has_secure_password
	  8       session[:user_id] = user.id
	  9       redirect_to root_url, notice: "Logged in"
	 10     else
	 11       flash.now.alert = "Email or password is invalid"
	 12       render "new"
	 13     end
	 14   end
	 15 
 	 16 end

### modify the navbar div
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	 13 <div class="navbar navbar-fixed-top">
	 14   <div class="navbar-inner">
	 15     <div class="container">
	 16       <%= link_to "Wikiful", root_path, :class => "brand" %>
	 17        <div class="session-controls">
	 18           <div class="btn-group">
	 19             <%= link_to "Sign Up", new_user_path, :class => "btn btn-mini" %>
	 20             <%= link_to "Log In", new_session_path, :class => "btn btn-mini" %>
	 21           </div>
	 22        </div>
	 23     </div>
	 24   </div> 
	 25 </div>  

### open localhost:3000

* Now you can sign in with the email and password stored before

### set a @current_user instance variable in ApplicationController 
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/application_controller.rb 
	class ApplicationController < ActionController::Base
	  # Prevent CSRF attacks by raising an exception.
	  # For APIs, you may want to use :null_session instead.
	  protect_from_forgery with: :exception

	  before_filter :get_categories

	  private
	  def get_categories
	    @categories = Category.all.order(:name)
	  end 

	  private
	  def current_user
	    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end 
	  helper_method :current_user

	end

### go back to app/views/layouts/application.html.erb and add some conditional logic to the navbar
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	 13 <div class="navbar navbar-fixed-top">
	 14   <div class="navbar-inner">
	 15     <div class="container">
	 16       <%= link_to "Wikiful", root_path, :class => "brand" %>
	 17        <div class="session-controls">
	 18           <% if current_user %>
	 19             Logged in as <%= current_user.email %>.
	 20           <% else %>
	 21             <div class="btn-group">
	 22               <%= link_to "Sign Up", new_user_path, :class => "btn btn-mini" %>
	 23               <%= link_to "Log In", new_session_path, :class => "btn btn-mini" %>
	 24             </div>
	 25           <% end %>
	 26        </div>
	 27     </div>
	 28   </div>
	 29 </div>
	 30 

### create a destroy action on our sessions controller
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/sessions_controller.rb 
	 16   def destroy
	 17     session[:user_id] = nil
	 18     redirect_to root_url, notice: "Logged out"
	 19   end
	 20 

### add a logout button to our navbar
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	 17        <div class="session-controls">
	 18           <% if current_user %>
	 19             <%= link_to "Log Out", session_path("current"), method: 'delete', :class => 'btn btn-primary btn-mini' %>
	 20             Logged in as <%= current_user.email %>.
	 21           <% else %>
	 22             <div class="btn-group">
	 23               <%= link_to "Sign Up", new_user_path, :class => "btn btn-mini" %>
	 24               <%= link_to "Log In", new_session_path, :class => "btn btn-mini" %>
	 25             </div>
	 26           <% end %>
	 27        </div>

### Open open localhost:3000

* Now you can log out

## improve our routes

### tells Rails to route the url
	limingth@gmail ~/Github/myRoR/wikiful$ vi config/routes.rb 
	  1 Wikiful::Application.routes.draw do
	  2   get 'signup', to: 'users#new', as: 'signup'
	  3   get 'login', to: 'sessions#new', as: 'login'
	  4   get 'logout', to: 'sessions#destroy', as: 'logout'
	  5   
	  6   #get "sessions/new"
	  7   resources :sessions
	  8   resources :users

### modify our links in hte navbar to take advantage of these new URLs.
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	 17        <div class="session-controls">
	 18           <% if current_user %>
	 19             <%= link_to "Log Out", logout_path :class => 'btn btn-primary btn-mini' %>
	 20             Logged in as <%= current_user.email %>.
	 21           <% else %>
	 22             <div class="btn-group">
	 23               <%= link_to "Sign Up", signup_path, :class => "btn btn-mini" %>
	 24               <%= link_to "Log In", signin_path, :class => "btn btn-mini" %>
	 25             </div>
	 26           <% end %>
	 27        </div>

## deal with limiting article creation access to logged in users

### add an authorize method to application controller
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/application_controller.rb 
	 18 
	 19   def authorize
	 20     redirect_to login_url, alert: "Not authorized" if current_user.nil?
	 21   end
	 22 

### create actions in ArticlesController
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/articles_controller.rb 
	  1 class ArticlesController < ApplicationController
	  2 
	  3   before_filter :authorize, only: [:new, :edit, :update]
	  4 
	  5   def index
	  6     @articles = Article.order(updated_at: :desc).limit(25)
	  7   end

### open localhost:3000

* If you're already logged in, log out. Then try to visit /articles/new. You should be redirected to the signin page and you should see a flash message indicating you're not authorized.

## automatically sign in users after they sign up for an account

### alter the create action on UsersController
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/users_controller.rb 
	  7   def create
	  8     @user = User.new(user_params)
	  9     if @user.save
	 10       session[:user_id] = @user.id
	 11       redirect_to root_url, notice: "Thank you for signing up"
	 12     else
	 13       render "new"
	 14     end
	 15   end
  
### open localhost:3000

* Now, when a new user is created, their ID will automatically be added to the session object.

### git commit

