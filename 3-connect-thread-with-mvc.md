
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
	limingth@gmail ~/Github/myRoR/wikiful/app/views/articles$ cd ../../..
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   ../3-connect-thread-with-mvc.md
	#	modified:   config/routes.rb
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	app/controllers/articles_controller.rb
	#	app/views/articles/
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/myRoR/wikiful$ git add .
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "add controllers and view files"
	[master 5fd53b3] add controllers and view files
	 6 files changed, 169 insertions(+), 17 deletions(-)
	 create mode 100644 wikiful/app/controllers/articles_controller.rb
	 create mode 100644 wikiful/app/views/articles/index.html.erb
	 create mode 100644 wikiful/app/views/articles/new.html.erb
	 create mode 100644 wikiful/app/views/articles/show.html.erb
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 22, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (12/12), done.
	Writing objects: 100% (14/14), 3.32 KiB | 0 bytes/s, done.
	Total 14 (delta 5), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   e435fa1..5fd53b3  master -> master
	limingth@gmail ~/Github/myRoR/wikiful$ 

## Getting Your Model Data into Article Views

### Before writing code, do this in Rails console
	limingth@gmail ~/Github/myRoR/wikiful$ rails c
	Loading development environment (Rails 4.0.1)

### verify we have some articles in db
	2.0.0-p247 :001 > Article.count
	   (1.0ms)  SELECT COUNT(*) FROM "articles"
	 => 101 
	2.0.0-p247 :002 > 

### show the most recent 25 articles
	2.0.0-p247 :002 > Article.order(updated_at: :desc).limit(25)
	  Article Load (16.3ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."updated_at" DESC LIMIT 25
	 => #<ActiveRecord::Relation [#<Article id: 101, title: "aaa", content: "this is a", created_at: "2013-11-27 21:48:53", updated_at: "2013-11-27 21:48:53">, #<Article id: 100, title: "Blanditiis ea voluptatibus molestias consequatur un...", content: "Nihil doloribus rerum qui cumque at rerum cupiditat...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 99, title: "Exercitationem autem dolorum sed non porro ea qui", content: "Voluptas et tenetur. Perferendis maxime provident s...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 98, title: "Et excepturi aut et aut voluptatem enim quo", content: "Aliquam corrupti quod delectus. Et quia inventore e...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 97, title: "Nihil quis dolorem ut occaecati eos aut quia nam si...", content: "Non impedit eveniet iure cupiditate quisquam. Debit...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 96, title: "Dolor iure eaque et inventore iste et", content: "Odit quibusdam et dolorum consequatur tempore persp...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 95, title: "Odio est est voluptatum voluptates", content: "Minima atque facere cumque alias voluptate nesciunt...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 94, title: "Rerum est eveniet repudiandae", content: "Porro sit sed omnis et dolorem ab aut. Officiis qua...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 93, title: "Ullam sed consequatur et veniam eum rerum maiores", content: "Placeat aut harum numquam. Explicabo voluptas quibu...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, #<Article id: 92, title: "Sed quasi ut cupiditate consequatur porro", content: "Voluptas quam vel quisquam ex dolorem. Minima qui m...", created_at: "2013-11-27 21:42:22", updated_at: "2013-11-27 21:42:22">, ...]> 
	2.0.0-p247 :003 > 

### now let's modify the index action on ArticlesController
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/controllers/articles_controller.rb 
	  1 class ArticlesController < ApplicationController
	  2   def index
	  3         @articles = Article.order(updated_at: :desc).limit(25)
	  4   end

### in web browser open http://localhost:3000/articles
	This is the index view for Articles

* still get the stub view we created since we haven't modified our view to render...

### have this view iterate over each article
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/views/articles/index.html.erb 
	  1 <h1> This is the index view for Articles </h1>
	  2 
	  3 <% @articles.each do |article| %>
	  4   <div>
	  5     <h3><%= article.title %></h3>
	  6         <p>Published on <%= article.created_at.strftime('%b %d, %Y') %></p>
	  7     <p>Filed under: <% article.categories.each do |category| %> 
	  8                       <%= category.name %>&nbsp;
	  9                     <% end %>
	 10     </p>            
	 11     <p><%= truncate(article.content, length: 200) %></p>
	 12   </div>
	 13 <% end %>
	 14 
    
### Go back to your browser and visit localhost:3000/articles/
	This is the index view for Articles

	aaa

	Published on Nov 27, 2013

	Filed under: bbb 

	this is a

	Blanditiis ea voluptatibus molestias consequatur unde enim placeat est

	Published on Nov 27, 2013

	Filed under: History 

	Nihil doloribus rerum qui cumque at rerum cupiditate. Et maxime quis sint ad veniam sequi corporis. Laboriosam excepturi aut. Neque in et. Tenetur possimus dolor est deserunt ut laboriosam. Libero ...

	Exercitationem autem dolorum sed non porro ea qui

	Published on Nov 27, 2013

	Filed under: History 

	Voluptas et tenetur. Perferendis maxime provident sunt neque quos rerum exercitationem. Delectus officiis ullam quis aut distinctio. Eius laborum rem qui ut maxime vel. Harum sit earum. Aut rerum d...

	Et excepturi aut et aut voluptatem enim quo

	Published on Nov 27, 2013

	Filed under: Mathematics 

	Aliquam corrupti quod delectus. Et quia inventore est neque in. Quis earum facere eos molestiae. Odit quo deleniti aspernatur et iusto culpa quae. Rem ipsam porro perferendis itaque ut. Voluptatem ...














