
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

### pg_restore 
	limingth@gmail ~/Github/myRoR$ pg_restore -U postgres -d dvdrental dvdrental.tar
	pg_restore: [archiver (db)] connection to database "dvdrental" failed: FATAL:  role "postgres" does not exist
	limingth@gmail ~/Github/myRoR$ createuser -s postgres

* the problem here is due to createdb newdb, should be dvdrental

### createdb dvdrental
	limingth@gmail ~/Github/myRoR$ createdb -T template0 dvdrental
	limingth@gmail ~/Github/myRoR$ pg_restore -U postgres -d dvdrental ./dvdrental.tar

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
	   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
	-----------+----------+----------+-------------+-------------+-----------------------
	 dvdrental | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	 newdb     | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
	 template0 | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/limingth          +
	           |          |          |             |             | limingth=CTc/limingth
	 template1 | limingth | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/limingth          +
	           |          |          |             |             | limingth=CTc/limingth
	(4 rows)

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
  
###           