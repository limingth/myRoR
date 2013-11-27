
# Connecting the Thread for Wikiful

## Connect the Thread for Articles

### make sure using right version of ruby
	limingth@gmail ~/Github/myRoR/wikiful$ rvm list
	Warning! PATH is not properly set up, '/Users/limingth/.rvm/gems/ruby-2.0.0-p247/bin' is not at first place,
	         usually this is caused by shell initialization files - check them for 'PATH=...' entries,
	         it might also help to re-add RVM to your dotfiles: 'rvm get stable --auto-dotfiles',
	         to fix temporarily in this shell session run: 'rvm use ruby-2.0.0-p247'.

	rvm rubies

	=* ruby-2.0.0-p247 [ x86_64 ]

	# => - current
	# =* - current && default
	#  * - default

	limingth@gmail ~/Github/myRoR/wikiful$ rvm use ruby-2.0.0-p247
	Warning! PATH is not properly set up, '/Users/limingth/.rvm/gems/ruby-2.0.0-p247/bin' is not at first place,
	         usually this is caused by shell initialization files - check them for 'PATH=...' entries,
	         it might also help to re-add RVM to your dotfiles: 'rvm get stable --auto-dotfiles',
	         to fix temporarily in this shell session run: 'rvm use ruby-2.0.0-p247'.
	Using /Users/limingth/.rvm/gems/ruby-2.0.0-p247
	limingth@gmail ~/Github/myRoR/wikiful$ 

### use the right gemset
	limingth@gmail ~/Github/myRoR/wikiful$ rvm gemset list

	gemsets for ruby-2.0.0-p247 (found in /Users/limingth/.rvm/gems/ruby-2.0.0-p247)
	=> (default)
	   global
	   wikful
	   wikiful

	limingth@gmail ~/Github/myRoR/wikiful$ rvm gemset use wikiful
	Using ruby-2.0.0-p247 with gemset wikiful
	limingth@gmail ~/Github/myRoR/wikiful$ rvm gemset list

	gemsets for ruby-2.0.0-p247 (found in /Users/limingth/.rvm/gems/ruby-2.0.0-p247)
	   (default)
	   global
	   wikful
	=> wikiful

	limingth@gmail ~/Github/myRoR/wikiful$ 

### git status
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch master
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	../3-connect-thread-with-mvc.md
	nothing added to commit but untracked files present (use "git add" to track)
	limingth@gmail ~/Github/myRoR/wikiful$ git add ../3-connect-thread-with-mvc.md 
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "add 3-connect-thread-with-mvc.md"
	[master e435fa1] add 3-connect-thread-with-mvc.md
	 1 file changed, 69 insertions(+)
	 create mode 100644 3-connect-thread-with-mvc.md
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 4, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (3/3), done.
	Writing objects: 100% (3/3), 830 bytes | 0 bytes/s, done.
	Total 3 (delta 1), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   3735811..e435fa1  master -> master
	limingth@gmail ~/Github/myRoR/wikiful$ 

### seed data
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:seed
	Could not find faker-1.2.0 in any of the sources
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
	Installing faker (1.2.0) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Installing pg (0.17.0) 
	Using bundler (1.3.5) 
	Using tilt (1.4.1) 
	Using sprockets (2.10.0) 
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
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:seed
	limingth@gmail ~/Github/myRoR/wikiful$ 

### create the articles controller
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/articles_controller.rb
	  1 ass ArticlesController < ApplicationController
	  2   def index
	  3   end
	  4   
	  5   def show
	  6   end
	  7 
	  8   def new
	  9   end
	 10 
	 11   def create
	 12   end
	 13 
	 14 end

### modify routes.rb
	limingth@gmail ~/Github/myRoR/wikiful$ vi config/routes.rb 
	  1 Wikiful::Application.routes.draw do
	  2   get "welcome/index"
	  3   # The priority is based upon order of creation: first created -> highest priority.
	  4   # See how all your routes lay out with "rake routes".
	  5 
	  6   # You can have the root of your site routed with "root"
	  7   root 'welcome#index'
	  8   resources :articles
	  9   

### in web browser open http://localhost:3000/articles
	Template is missing
	Missing template articles/index, application/index with {:locale=>[:en], :formats=>[:html], :handlers=>[:erb, :builder, :raw, :ruby, :jbuilder, :coffee]}. Searched in: * "/Users/limingth/Github/myRoR/wikiful/app/views"

* This error makes sense, since we haven't generated a view file yet for our articles index. 

### create articles folder and three view files
	limingth@gmail ~/Github/myRoR/wikiful$ mkdir app/views/articles
	limingth@gmail ~/Github/myRoR/wikiful$ cd app/views/articles/
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ touch index.html.erb 
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ touch show.html.erb
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ touch new.html.erb
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ 

### modify three view files
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ vi index.html.erb 
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ cat index.html.erb 
	<h1> This is the index view for Articles </h1>

	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ 

	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ vi show.html.erb 
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ cat show.html.erb 
	<h1>This is the view for show Articles</h1>
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ 

	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ vi new.html.erb 
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ cat new.html.erb 
	<h1>This is the view for new Articles</h1>
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ 

### in web browser re-open http://localhost:3000/articles
	This is the index view for Articles

* It works. You should see the index view you just created.  and also below 2 URLs

#### open http://localhost:3000/articles/new
	This is the view for new Articles

#### open http://localhost:3000/articles/show
	This is the view for show Articles

### git push

