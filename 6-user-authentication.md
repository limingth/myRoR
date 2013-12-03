
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


## Create Sessions, Login/Logout, and Authorization Flow




















  
