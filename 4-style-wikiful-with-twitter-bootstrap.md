
# Layout and Styling with Twitter Bootstrap

## Adding Bootstrap

### add some gems to Gemfile
	limingth@gmail ~/Github/myRoR/wikiful$ vi Gemfile
	 52 gem 'twitter-bootstrap-rails'
	 53 gem 'less-rails'
	 54 gem 'therubyracer'
	 55 

## run bundle to update gemset
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
	Using bundler (1.3.5) 
	Using coffee-script-source (1.6.3) 
	Using execjs (2.0.2) 
	Using coffee-script (2.2.0) 
	Using thor (0.18.1) 
	Using railties (4.0.1) 
	Using coffee-rails (4.0.1) 
	Installing commonjs (0.2.7) 
	Using faker (1.2.0) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Installing less (2.4.0) 
	Installing less-rails (2.4.2) 
	Installing libv8 (3.16.14.3) 
	Using pg (0.17.0) 
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
	Your bundle is complete!
	Use `bundle show [gemname]` to see where a bundled gem is installed.
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
	limingth@gmail ~/Github/myRoR/wikiful$ 

### run the twitter-bootstrap-rails install generator
	limingth@gmail ~/Github/myRoR/wikiful$ rails g bootstrap:install
	      insert  app/assets/javascripts/application.js
	      create  app/assets/javascripts/bootstrap.js.coffee
	      create  app/assets/stylesheets/bootstrap_and_overrides.css.less
	      create  config/locales/en.bootstrap.yml
	        gsub  app/assets/stylesheets/application.css
	        gsub  app/assets/stylesheets/application.css
	limingth@gmail ~/Github/myRoR/wikiful$ 

### git status
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch gh-pages
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   Gemfile
	#	modified:   Gemfile.lock
	#	modified:   app/assets/javascripts/application.js
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	../4-style-wikiful-with-twitter-bootstrap.md
	#	app/assets/javascripts/bootstrap.js.coffee
	#	app/assets/stylesheets/bootstrap_and_overrides.css.less
	#	config/locales/en.bootstrap.yml
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/myRoR/wikiful$ 

### restart rails server
	limingth@gmail ~/Github/myRoR/wikiful$ rails s
	Could not find commonjs-0.2.7 in any of the sources
	Run `bundle install` to install missing gems.
	limingth@gmail ~/Github/myRoR/wikiful$ bundle install
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
	Using coffee-script-source (1.6.3) 
	Using execjs (2.0.2) 
	Using coffee-script (2.2.0) 
	Using thor (0.18.1) 
	Using railties (4.0.1) 
	Using coffee-rails (4.0.1) 
	Installing commonjs (0.2.7) 
	Using faker (1.2.0) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Installing less (2.4.0) 
	Installing less-rails (2.4.2) 
	Installing libv8 (3.16.14.3) 
	Using pg (0.17.0) 
	Using bundler (1.3.5) 
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
	Your bundle is complete!
	Use `bundle show [gemname]` to see where a bundled gem is installed.
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
	limingth@gmail ~/Github/myRoR/wikiful$ 

	limingth@gmail ~/Github/myRoR/wikiful$ rails s
	=> Booting WEBrick
	=> Rails 4.0.1 application starting in development on http://0.0.0.0:3000
	=> Run `rails server -h` for more startup options
	=> Ctrl-C to shutdown server
	[2013-11-27 19:53:10] INFO  WEBrick 1.3.1
	[2013-11-27 19:53:10] INFO  ruby 2.0.0 (2013-06-27) [x86_64-darwin12.4.0]
	[2013-11-27 19:53:10] INFO  WEBrick::HTTPServer#start: pid=21519 port=3000

### visit your articles index page at localhost:3000/articles

* Note the immediate change in the typography and link styling.

### git commit
	limingth@gmail ~/Github/myRoR/wikiful$ git add .
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "add bootstrap to wikiful"
	[gh-pages 355c21a] add bootstrap to wikiful
	 6 files changed, 74 insertions(+)
	 create mode 100644 wikiful/app/assets/javascripts/bootstrap.js.coffee
	 create mode 100644 wikiful/app/assets/stylesheets/bootstrap_and_overrides.css.less
	 create mode 100644 wikiful/config/locales/en.bootstrap.yml
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 26, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (15/15), done.
	Writing objects: 100% (15/15), 2.24 KiB | 0 bytes/s, done.
	Total 15 (delta 7), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   09fccc0..355c21a  gh-pages -> gh-pages
	limingth@gmail ~/Github/myRoR/wikiful$ 

## Base Application Layout

### modify application.html.erb 
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	  1 <!DOCTYPE html>
	  2 <html>
	  3 <head>
	  4   <title>Wikiful</title>
	  5   <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => t    rue %>
	  6   <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
	  7   <%= csrf_meta_tags %>
	  8 </head>
	  9 <body>
	 10 
	 11 <div class="container">
	 12   <div class="row">
	 13     <div class="span9"><%= yield %></div>
	 14     <div class="span3">
	 15       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor, hic, volupta    tes, officiis dolorum beatae sequi dolores id fugiat provident eaque quia neque odit m    agni praesentium excepturi quae vero deserunt laudantium.</p>
	 16     </div>
	 17   </div>
	 18 </div>
	 19 
	 20 </body>
	 21 </html>

### visit any of the pages for Wikiful in your browser

* should see a sidebar that contains our lorem text

### finish out the sidebar
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	  1 <!DOCTYPE html>
	  2 <html>
	  3 <head>
	  4   <title>Wikiful</title>
	  5   <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
	  6   <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
	  7   <%= csrf_meta_tags %>
	  8 </head>
	  9 <body>
	 10 
	 11 <div class="container">
	 12   <div class="row">
	 13     <div class="span9"><%= yield %></div>
	 14 
	 15         <div class="span3 sidebar">
	 16           <div class="my-wiki-site">
	 17             <h4>My Wikiful</h4>
	 18             <ul>
	 19               <li><%= link_to "Write a Wiki", new_article_path %></li>
	 20             </ul>
	 21           </div>
	 22           <div class="categories-sidebar">
	 23             <h4>Categories</h4>
	 24             <ul>
	 25               <% @categories.each do |category| %>
	 26                 <li><%= link_to category.name, category %></li>
	 27               <% end %>
	 28             </ul>
	 29           </div>
	 30           <div class="about">
	 31             <h4>About Wikiful</h4>
	 32             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium architecto ea    rum neque perspiciatis quia animi debitis quod repellat vitae explicabo. Sapiente aliquam reprehen    derit id vitae atque ducimus facere molestias soluta?</p>
	 33           </div>
	 34         </div>
	 35 
	 36   </div>
	 37 </div>
	 38 
	 39 </body>
	 40 </html>

### Go to your browser and getting an error message 
	NoMethodError in Welcome#index
	Showing /Users/limingth/Github/myRoR/wikiful/app/views/layouts/application.html.erb where line #25 raised:

	undefined method `each' for nil:NilClass
	Extracted source (around line #25):     
	   	  <div class="categories-sidebar">
	   	    <h4>Categories</h4>
	   	    <ul>
	25->      <% @categories.each do |category| %>
	   		<li><%= link_to category.name, category %></li>
	   	      <% end %>
	   	    </ul>

	Rails.root: /Users/limingth/Github/myRoR/wikiful

### add a private method to create an instance varible called @categories
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/application_controller.rb 
	  1 class ApplicationController < ActionController::Base
	  2   # Prevent CSRF attacks by raising an exception.
	  3   # For APIs, you may want to use :null_session instead.
	  4   protect_from_forgery with: :exception
	  5 
	  6   before_filter :get_categories
	  7 
	  8   private
	  9   def get_categories
	 10     @categories = Category.all.order(:name)
	 11   end
	 12 
	 13 end

### visit any of the pages for Wikiful in your browser
* notice the sidebar should render.


### now tackle the navbar
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	  1 <!DOCTYPE html>
	  2 <html>
	  3 <head>
	  4   <title>Wikiful</title>
	  5   <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
	  6   <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
	  7   <%= csrf_meta_tags %>
	  8 </head>
	  9 <body>
	 10 
	 11 <div class="navbar navbar-fixed-top">
	 12   <div class="navbar-inner">
	 13     <div class="container">
	 14       <%= link_to "Wikiful", root_path, :class => "brand" %>
	 15       <div style="float: right;">Eventually log in/out and sign up links will go here</div>
	 16     </div>
	 17   </div>
	 18 </div>
	 19 
	 20 <div class="container">
	 21   <div class="row">
	 22     <div class="span9"><%= yield %></div>
	 23 

### puts top-padding on the body element
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/assets/stylesheets/bootstrap_and_overrides.css.less 
	  1 @import "twitter/bootstrap/bootstrap";
	  2 body { padding-top: 60px; }
	  3 @import "twitter/bootstrap/responsive";
	  4 

### refresh your browser
* the navbar should no longer obscure our content in the main container.

*use chrome browser to test it, do NOT test it on Safari*

### improve support for IE
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/layouts/application.html.erb 
	  1 <!DOCTYPE html>
	  2 <html>
	  3 <head>
	  4   <title>Wikiful</title>
	  5         <!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="t    ext/javascript"></script> <![endif]-->
	  6   <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
	  7   <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
	  8   <%= csrf_meta_tags %>
	  9  <meta content="width=device-width, initial-scale=1.0" name="viewport">
	 10 </head>
	 11 <body>

* add 2 line, see them at line 5 and line 9

###
