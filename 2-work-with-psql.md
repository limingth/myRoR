
# Models and Data Persistence in Rails

## Install PostgresSQL

### psql --version 
	limingth@gmail ~/Github/myRoR$ psql --version
	psql (PostgreSQL) 9.1.5
	contains support for command-line editing
	limingth@gmail ~/Github/myRoR$ 

### download Postgres93.zip
[http://postgresapp.com/](http://postgresapp.com/)

### click and install 
* move Postgres application to app folder

### add it to PATH 
	limingth@gmail ~/Github/myRoR$ ls /Applications/Postgres93.app/Contents/MacOS/bin/
	clusterdb		gdalsrsinfo		pg_receivexlog
	createdb		gdaltindex		pg_resetxlog
	createlang		gdaltransform		pg_restore
	createuser		gdalwarp		pg_standby
	cs2cs			geod			pg_test_fsync
	dropdb			initdb			pg_test_timing
	droplang		invgeod			pg_upgrade
	dropuser		invproj			pgbench
	ecpg			nad2bin			pgsql2shp
	gdal_contour		nearblack		postgres
	gdal_grid		ogr2ogr			postmaster
	gdal_rasterize		ogrinfo			proj
	gdal_translate		ogrtindex		psql
	gdaladdo		oid2name		raster2pgsql
	gdalbuildvrt		pg_archivecleanup	reindexdb
	gdaldem			pg_basebackup		shp2pgsql
	gdalenhance		pg_config		testepsg
	gdalinfo		pg_controldata		vacuumdb
	gdallocationinfo	pg_ctl			vacuumlo
	gdalmanage		pg_dump
	gdalserver		pg_dumpall
	limingth@gmail ~/Github/myRoR$ export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

### check new version
	limingth@gmail ~/Github/myRoR$ which psql
	/Applications/Postgres93.app/Contents/MacOS/bin/psql
	limingth@gmail ~/Github/myRoR$ 

	limingth@gmail ~/Github/myRoR$ psql --version
	psql (PostgreSQL) 9.3.1
	limingth@gmail ~/Github/myRoR$ 

## SQL Crash Course Using PostgreSQL

### Download PostgreSQL sample database
http://www.postgresqltutorial.com/?wpdmact=process&did=MS5ob3RsaW5r

### unzip dvdrental.zip
	limingth@gmail ~/Github/myRoR$ unzip dvdrental.zip 
	Archive:  dvdrental.zip
	  inflating: dvdrental.tar           
	limingth@gmail ~/Github/myRoR$ ls dvdrental.tar 
	dvdrental.tar
	limingth@gmail ~/Github/myRoR$ 

### createdb newdb
	limingth@gmail ~/Github/myRoR$ createdb -T template0 newdb

* where does postgresql store the database
	- /Users/limingth/Library/Application Support/Postgres93/var/base

	The actual database files will be under /usr/local/var/postgres after you create the database. So, just create a database and then see what's new or changed under /usr/local/var/postgres. There isn't a single "dbname.db" file or anything like that, each database is a collection of files with names that are only meaningful to the database server.

<http://stackoverflow.com/questions/5052907/location-of-postgresql-database-on-os-x>

<http://stackoverflow.com/questions/1137060/where-does-postgresql-store-the-database>


### pg_restore 
	limingth@gmail ~/Github/myRoR$ pg_restore -U postgres -d dvdrental ./dvdrental.tar
	pg_restore: [archiver (db)] connection to database "dvdrental" failed: FATAL:  role "postgres" does not exist
	limingth@gmail ~/Github/myRoR$ createuser -s postgres

	limingth@gmail ~/Github/myRoR$ sudo pg_restore -U postgres -d dvdrental ./dvdrental.tar 
	pg_restore: [archiver (db)] connection to database "dvdrental" failed: FATAL:  database "dvdrental" does not exist

* the problem here is due to createdb newdb, should be dvdrental

### createdb dvdrental
	limingth@gmail ~/Github/myRoR$ createdb -T template0 dvdrental
	limingth@gmail ~/Github/myRoR$ pg_restore -U postgres -d dvdrental ./dvdrental.tar
	(if pg_restore execute successfully, there should be NO message output)
	limingth@gmail ~/Github/myRoR$ 

### let's verify the restoration
	limingth@gmail ~$ psql
	psql: could not connect to server: No such file or directory
		Is the server running locally and accepting
		connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?
	limingth@gmail ~$ export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
	limingth@gmail ~$ psql 
	psql (9.3.1)
	Type "help" for help.

	limingth=# \list
	                                       List of databases
	        Name         |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
	---------------------+----------+----------+-------------+-------------+-----------------------
	 dvdrental           | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	 limingth            | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	 newdb               | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	 postgres            | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	 template0           | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/limingth          +
	                     |          |          |             |             | limingth=CTc/limingth
	 template1           | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/limingth          +
	                     |          |          |             |             | limingth=CTc/limingth
	 wikiful_development | wikiful  | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	 wikiful_test        | wikiful  | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	(8 rows)

	limingth=# select version();
	                                                                                 version                                                                                  
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	 PostgreSQL 9.3.1 on x86_64-apple-darwin12.5.0, compiled by i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2336.11.00), 64-bit
	(1 row)

	limingth=# select * from dvdrental;
	ERROR:  relation "dvdrental" does not exist
	LINE 1: select * from dvdrental;
	                      ^
	limingth=# \q
	limingth@gmail ~$ 

* the reason here is we didn't use "-d dbname" argument to psql command

		limingth@gmail ~$ psql -d dvdrental
		psql (9.3.1)
		Type "help" for help.
		dvdrental=# 

* notice here the prompt is changed

		dvdrental=# select * from customer;
		 customer_id | store_id | first_name  |  last_name   |                  email                   | address_id | activebool | create_date |       last_update       | active 
		-------------+----------+-------------+--------------+------------------------------------------+------------+------------+-------------+-------------------------+--------
		         524 |        1 | Jared       | Ely          | jared.ely@sakilacustomer.org             |        530 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           1 |        1 | Mary        | Smith        | mary.smith@sakilacustomer.org            |          5 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           2 |        1 | Patricia    | Johnson      | patricia.johnson@sakilacustomer.org      |          6 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           3 |        1 | Linda       | Williams     | linda.williams@sakilacustomer.org        |          7 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           4 |        2 | Barbara     | Jones        | barbara.jones@sakilacustomer.org         |          8 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           5 |        1 | Elizabeth   | Brown        | elizabeth.brown@sakilacustomer.org       |          9 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           6 |        2 | Jennifer    | Davis        | jennifer.davis@sakilacustomer.org        |         10 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           7 |        1 | Maria       | Miller       | maria.miller@sakilacustomer.org          |         11 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           8 |        2 | Susan       | Wilson       | susan.wilson@sakilacustomer.org          |         12 | t          | 2006-02-14  | 2013-05-26 14:49:45.738 |      1
		           9 |        2 | Margaret    | Moore        | margaret.moore@sakilacustomer.org        |         13 | 

* See it works! 

__Thanks [Ben White](https://plus.google.com/u/0/117357428990916642118) :-)__

## The ActiveRecord ORM and Models in Rails

## Configure Rails to Work with PostgreSQL

### modify Gemfile
	limingth@gmail ~/Github/myRoR/wikiful$ vi Gemfile
		
	  6 # Use sqlite3 as the database for Active Record
	  7 #gem 'sqlite3'
	  8 gem 'pg'

### bundle install 
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
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Installing pg (0.17.0)   
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
	limingth@gmail ~/Github/myRoR/wikiful$ 

### 
	  1 # SQLite version 3.x
	  2 #   gem install sqlite3
	  3 #
	  4 #   Ensure the SQLite 3 gem is defined in your Gemfile
	  5 #   gem 'sqlite3'
	  6 development:
	  7   adapter: postgresql
	  8   database: wikiful_development
	  9   encoding: unicode
	 10   user: wikiful
	 11   host: localhost
	 12   pool: 5
	 13   timeout: 5000
	 14 
	 15 # Warning: The database defined as "test" will be erased and
	 16 # re-generated from your development database when you run "rake".
	 17 # Do not set this db to the same as development or production.
	 18 test:
	 19   adapter: postgresql
	 20   database: wikiful_test
	 21   encoding: unicode
	 22   user: wikiful
	 23   host: localhost
	 24   pool: 5
	 25   timeout: 5000
	 26 
	 27 production:
	 28   adapter: postgresql
	 29   database: wikiful_production
	 30   encoding: unicode
	 31   pool: 5
	 32   timeout: 5000

### create user
	limingth@gmail ~/Github/myRoR/wikiful$ createuser -s wikiful
	limingth@gmail ~/Github/myRoR/wikiful$                          

### init db
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:create
	limingth@gmail ~/Github/myRoR/wikiful$ 

### git status
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   Gemfile
	#	modified:   Gemfile.lock
	#	modified:   config/database.yml
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	../2-work-with-psql.md
	#	../dvdrental.tar
	#	../dvdrental.zip
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/myRoR/wikiful$ 

### git commit
	limingth@gmail ~/Github/myRoR/wikiful$ git add .
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "set up with Postgresql"
	[master a24f186] set up with Postgresql
	 3 files changed, 17 insertions(+), 9 deletions(-)
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 13, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (7/7), done.
	Writing objects: 100% (7/7), 725 bytes | 0 bytes/s, done.
	Total 7 (delta 6), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   f690a90..a24f186  master -> master

## Modeling Articles, Categories, and Users for Wikiful

### create Article model
	limingth@gmail ~/Github/myRoR/wikiful$ rails generate model Article title:string content:text
	      invoke  active_record
	      create    db/migrate/20131126012459_create_articles.rb
	      create    app/models/article.rb
	      invoke    test_unit
	      create      test/models/article_test.rb
	      create      test/fixtures/articles.yml
	limingth@gmail ~/Github/myRoR/wikiful$ 

### create user model
limingth@gmail ~/Github/myRoR/wikiful$ vi app/models/article.rb 
	  1 class Article < ActiveRecord::Base
	  2 belongs_to :user
	  3 end

### add has_many
	  1 class Article < ActiveRecord::Base
	  2 belongs_to :user
	  3 has_many :article_categories
	  4 has_many :categories, through: :article_categories
	  5 end
                 
### add validates
	  1 class Article < ActiveRecord::Base
	  2 belongs_to :user
	  3 has_many :article_categories
	  4 has_many :categories, through: :article_categories
	  5 validates :title, presence: true
	  6 validates :content, presence: true
	  7 validates :categories, presence: true
	  8 end

### migrate model
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:migrate
	==  CreateArticles: migrating =================================================
	-- create_table(:articles)
	   -> 0.0538s
	==  CreateArticles: migrated (0.0549s) ========================================

	limingth@gmail ~/Github/myRoR/wikiful$ 
  
### git commit
	limingth@gmail ~/Github/myRoR/wikiful$ git add ..
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch master
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	new file:   ../2-work-with-psql.md
	#	new file:   ../dvdrental.tar
	#	new file:   ../dvdrental.zip
	#	new file:   app/models/article.rb
	#	new file:   db/migrate/20131126012459_create_articles.rb
	#	new file:   db/schema.rb
	#	new file:   test/fixtures/articles.yml
	#	new file:   test/models/article_test.rb
	#
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "added Article model"
	[master 1856fe8] added Article model
	 8 files changed, 347 insertions(+)
	 create mode 100644 2-work-with-psql.md
	 create mode 100644 dvdrental.tar
	 create mode 100644 dvdrental.zip
	 create mode 100644 wikiful/app/models/article.rb
	 create mode 100644 wikiful/db/migrate/20131126012459_create_articles.rb
	 create mode 100644 wikiful/db/schema.rb
	 create mode 100644 wikiful/test/fixtures/articles.yml
	 create mode 100644 wikiful/test/models/article_test.rb
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 25, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (18/18), done.
	Writing objects: 100% (18/18), 1.12 MiB | 0 bytes/s, done.
	Total 18 (delta 3), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   a24f186..1856fe8  master -> master
	limingth@gmail ~/Github/myRoR/wikiful$           

### create ArticleCategory
	limingth@gmail ~/Github/myRoR/wikiful$ rails g model ArticleCategory
	      invoke  active_record
	      create    db/migrate/20131126014146_create_article_categories.rb
	      create    app/models/article_category.rb
	      invoke    test_unit
	      create      test/models/article_category_test.rb
	      create      test/fixtures/article_categories.yml
	limingth@gmail ~/Github/myRoR/wikiful$ 

### modify migration file
	limingth@gmail ~/Github/myRoR/wikiful$ vi db/migrate/20131126014146_create_article_categories.rb 

	  1 class CreateArticleCategories < ActiveRecord::Migration
	  2   def change
	  3     create_table :article_categories do |t|
	  4         t.belongs_to :article
	  5         t.belongs_to :category
	  6       t.timestamps
	  7     end
	  8   end
	  9 end

### modify article category
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/models/article_category.rb 

	  1 class ArticleCategory < ActiveRecord::Base
	  2   belongs_to :article
	  3   belongs_to :category
	  4 end

### rake db:migrate
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:migrate
	==  CreateArticleCategories: migrating ========================================
	-- create_table(:article_categories)
	   -> 0.0205s
	==  CreateArticleCategories: migrated (0.0207s) ===============================

	limingth@gmail ~/Github/myRoR/wikiful$ 

### git commit
	limingth@gmail ~/Github/myRoR/wikiful$ git add .
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch master
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	new file:   app/models/article_category.rb
	#	new file:   db/migrate/20131126014146_create_article_categories.rb
	#	modified:   db/schema.rb
	#	new file:   test/fixtures/article_categories.yml
	#	new file:   test/models/article_category_test.rb
	#
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   ../2-work-with-psql.md
	#
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "just added a new model"
	[master 74e8b1e] just added a new model
	 6 files changed, 117 insertions(+), 2 deletions(-)
	 create mode 100644 wikiful/app/models/article_category.rb
	 create mode 100644 wikiful/db/migrate/20131126014146_create_article_categories.rb
	 create mode 100644 wikiful/test/fixtures/article_categories.yml
	 create mode 100644 wikiful/test/models/article_category_test.rb
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 27, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (16/16), done.
	Writing objects: 100% (16/16), 2.55 KiB | 0 bytes/s, done.
	Total 16 (delta 6), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   1856fe8..74e8b1e  master -> master
	limingth@gmail ~/Github/myRoR/wikiful$ 


### create Category model
	limingth@gmail ~/Github/myRoR/wikiful$ rails generate model Category title:string content:text
	      invoke  active_record
	      create    db/migrate/20131126015934_create_categories.rb
	      create    app/models/category.rb
	      invoke    test_unit
	      create      test/models/category_test.rb
	      create      test/fixtures/categories.yml
	limingth@gmail ~/Github/myRoR/wikiful$ 

### modify Category files
	limingth@gmail ~/Github/myRoR/wikiful$ vi app/models/category.rb 
	  1 class Category < ActiveRecord::Base
	  2 belongs_to :user
	  3 has_many :article_categories
	  4 has_many :categories, through: :article_categories
	  5 validates :title, presence: true
	  6 validates :content, presence: true	  
	  7 end

### 
	limingth@gmail ~/Github/myRoR/wikiful$ rails g model ArticalCategory
	      invoke  active_record
	      create    db/migrate/20131126020311_create_artical_categories.rb
	      create    app/models/artical_category.rb
	      invoke    test_unit
	      create      test/models/artical_category_test.rb
	      create      test/fixtures/artical_categories.yml
	limingth@gmail ~/Github/myRoR/wikiful$ 

### 
	limingth@gmail ~/Github/myRoR/wikiful$ vi db/migrate/20131126020311_create_artical_categories.rb 
	limingth@gmail ~/Github/myRoR/wikiful$ 
	  1 class CreateArticalCategories < ActiveRecord::Migration
	  2   def change
	  3     create_table :artical_categories do |t|
	  4         t.belongs_to :article
	  5         t.belongs_to :category
	  6       t.timestamps
	  7     end
	  8   end
	  9 end

### rake db:migrate
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:migrate
	==  CreateCategories: migrating ===============================================
	-- create_table(:categories)
	   -> 0.0212s
	==  CreateCategories: migrated (0.0214s) ======================================

	==  CreateArticalCategories: migrating ========================================
	-- create_table(:artical_categories)
	   -> 0.0101s
	==  CreateArticalCategories: migrated (0.0118s) ===============================

	limingth@gmail ~/Github/myRoR/wikiful$   

### git commit
	limingth@gmail ~/Github/myRoR/wikiful$ git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   ../2-work-with-psql.md
	#	modified:   db/schema.rb
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	app/models/artical_category.rb
	#	app/models/category.rb
	#	db/migrate/20131126015934_create_categories.rb
	#	db/migrate/20131126020311_create_artical_categories.rb
	#	test/fixtures/artical_categories.yml
	#	test/fixtures/categories.yml
	#	test/models/artical_category_test.rb
	#	test/models/category_test.rb
	no changes added to commit (use "git add" and/or "git commit -a")
	limingth@gmail ~/Github/myRoR/wikiful$ git add .
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "added Category model"
	[master 687a718] added Category model
	 10 files changed, 171 insertions(+), 1 deletion(-)
	 create mode 100644 wikiful/app/models/artical_category.rb
	 create mode 100644 wikiful/app/models/category.rb
	 create mode 100644 wikiful/db/migrate/20131126015934_create_categories.rb
	 create mode 100644 wikiful/db/migrate/20131126020311_create_artical_categories.rb
	 create mode 100644 wikiful/test/fixtures/artical_categories.yml
	 create mode 100644 wikiful/test/fixtures/categories.yml
	 create mode 100644 wikiful/test/models/artical_category_test.rb
	 create mode 100644 wikiful/test/models/category_test.rb
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 29, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (17/17), done.
	Writing objects: 100% (18/18), 2.51 KiB | 0 bytes/s, done.
	Total 18 (delta 7), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   74e8b1e..687a718  master -> master
	limingth@gmail ~/Github/myRoR/wikiful$ 

### rails console
	limingth@gmail ~/Github/myRoR/wikiful$ rails c
	Loading development environment (Rails 4.0.1)
	2.0.0-p247 :001 > Article
	 => Article(no database connection) 
	2.0.0-p247 :002 > Article.count
	   (0.9ms)  SELECT COUNT(*) FROM "articles"
	 => 0 
	2.0.0-p247 :003 > Article.first
	  Article Load (2.3ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" ASC LIMIT 1
	 => nil 
	2.0.0-p247 :004 > 

### redo it
	limingth@gmail ~/Github/myRoR/wikiful$ rails console
	Loading development environment (Rails 4.0.1)
	2.0.0-p247 :001 > b = Category.new
	 => #<Category id: nil, title: nil, content: nil, created_at: nil, updated_at: nil> 
	2.0.0-p247 :002 > b.title = "bbb"
	 => "bbb" 
	2.0.0-p247 :003 > b.content = "bccc"
	 => "bccc" 
	2.0.0-p247 :004 > b.save
	   (8.2ms)  BEGIN
	  SQL (14.8ms)  INSERT INTO "categories" ("content", "created_at", "title", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["content", "bccc"], ["created_at", Tue, 26 Nov 2013 19:24:31 UTC +00:00], ["title", "bbb"], ["updated_at", Tue, 26 Nov 2013 19:24:31 UTC +00:00]]
	   (2.5ms)  COMMIT
	 => true 
	2.0.0-p247 :005 > a = Article.new(title:"aaa", content:"this is b content")
	 => #<Article id: nil, title: "aaa", content: "this is b content", created_at: nil, updated_at: nil> 
	2.0.0-p247 :006 > a.save
	   (2.0ms)  BEGIN
	   (0.6ms)  ROLLBACK
	 => false 
	2.0.0-p247 :007 > a.categories << b
	 => #<ActiveRecord::Associations::CollectionProxy [#<Category id: 1, title: "bbb", content: "bccc", created_at: "2013-11-26 19:24:31", updated_at: "2013-11-26 19:24:31">]> 
	2.0.0-p247 :008 > a.save
	   (9.1ms)  BEGIN
	  SQL (18.3ms)  INSERT INTO "articles" ("content", "created_at", "title", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["content", "this is b content"], ["created_at", Tue, 26 Nov 2013 19:26:25 UTC +00:00], ["title", "aaa"], ["updated_at", Tue, 26 Nov 2013 19:26:25 UTC +00:00]]
	  SQL (4.3ms)  INSERT INTO "article_categories" ("article_id", "category_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["article_id", 1], ["category_id", 1], ["created_at", Tue, 26 Nov 2013 19:26:25 UTC +00:00], ["updated_at", Tue, 26 Nov 2013 19:26:25 UTC +00:00]]
	   (3.0ms)  COMMIT
	 => true 
	2.0.0-p247 :009 > 

	2.0.0-p247 :009 > Article.count
	   (2.3ms)  SELECT COUNT(*) FROM "articles"
	 => 1 
	2.0.0-p247 :010 > Article.first
	  Article Load (3.1ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" ASC LIMIT 1
	 => #<Article id: 1, title: "aaa", content: "this is b content", created_at: "2013-11-26 19:26:25", updated_at: "2013-11-26 19:26:25"> 
	2.0.0-p247 :011 > Article.last
	  Article Load (1.5ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" DESC LIMIT 1
	 => #<Article id: 1, title: "aaa", content: "this is b content", created_at: "2013-11-26 19:26:25", updated_at: "2013-11-26 19:26:25"> 
	2.0.0-p247 :012 > 


## Seed Your Data

### add Faker to your Gemfile
	limingth@gmail ~/Github/myRoR/wikiful$ vi Gemfile
	 42 # Use Capistrano for deployment
	 43 # gem 'capistrano', group: :development
	 44 
	 45 group :development, :test do
	 46 gem 'faker'
	 47 end
	 48 
	 49 # Use debugger
	 50 # gem 'debugger', group: [:development, :test]
	 51 

### update your Gems	
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
	Installing faker (1.2.0) 
	Using hike (1.2.3) 
	Using jbuilder (1.5.2) 
	Using jquery-rails (3.0.4) 
	Using json (1.8.1) 
	Using pg (0.17.0) 
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

### write your own code for seeds.rb to generate data
	limingth@gmail ~/Github/myRoR/wikiful$ vi db/seeds.rb 
	  1 # This file should contain all the record creation needed to seed the database with it    s default values.
	  2 # The data can then be loaded with the rake db:seed (or created alongside the db with     db:setup).
	  3 #
	  4 # Examples:
	  5 #
	  6 #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
	  7 #   Mayor.create(name: 'Emanuel', city: cities.first)
	  8 
	  9 
	 10 categories = Category.create([
	 11   { name: 'History'}, {name: 'Biology'}, {name: 'Literature'},
	 12   { name: 'Mathematics'}, { name: 'Music Theory'}, { name: 'Computer Science'},
	 13   { name: 'Sociology'}, {name: 'Chemistry'}
	 14 ])
	 15 
	 16 # create 50 articles, with random titles, 250 words of content, and
	 17 # randomly assign one of the categories above to each article
	 18 for i in 0..49
	 19   title = Faker::Lorem.sentence(rand(2..10)).chomp('.')
	 20   content = Faker::Lorem.paragraph(word_count=250)
	 21 
	 22   # randomly assign one of the categories we just created
	 23   category = Category.first(offset: rand(Category.count))
	 24   a = Article.create(title: title, content: content, categories: [category,])
	 25 end

### seed your data                      
	limingth@gmail ~/Github/myRoR/wikiful$ rake db:seed

### open the rails console 
	limingth@gmail ~/Github/myRoR/wikiful$ rails console
	Loading development environment (Rails 4.0.1)
	2.0.0-p247 :001 > Article.count
	   (1.6ms)  SELECT COUNT(*) FROM "articles"
	 => 50 
	2.0.0-p247 :002 > Article.first
	  Article Load (26.6ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" ASC LIMIT 1
	 => #<Article id: 1, title: "Aut veritatis animi voluptas doloribus enim archite...", content: "Nam commodi magni aut veritatis. Fugit repudiandae ...", created_at: "2013-11-26 19:39:21", updated_at: "2013-11-26 19:39:21"> 
	2.0.0-p247 :003 > quit
	limingth@gmail ~/Github/myRoR/wikiful$ 

### make sure to add and commit the changes 
	limingth@gmail ~/Github/myRoR/wikiful$ git add .
	limingth@gmail ~/Github/myRoR/wikiful$ git commit -a -m "seed the data"
	[master 679b9d3] seed the data
	 9 files changed, 185 insertions(+), 23 deletions(-)
	limingth@gmail ~/Github/myRoR/wikiful$ git push
	Counting objects: 27, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (14/14), done.
	Writing objects: 100% (14/14), 2.95 KiB | 0 bytes/s, done.
	Total 14 (delta 12), reused 0 (delta 0)
	To git@github.com:limingth/myRoR.git
	   cec5e80..679b9d3  master -> master
	limingth@gmail ~/Github/myRoR/wikiful$ 

**Thanks [Rick Thomas](https://plus.google.com/u/0/109332920695988460104). I am so grateful for all the help you gave to me :))**	