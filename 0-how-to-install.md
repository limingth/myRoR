# How To Install

## Install RVM

### Check Version

    ruby -v 

### Install RVM:

    \curl -L https://get.rvm.io | bash
  
### Make update-to-date 

    rvm get stable

### Install Ruby

    rvm install 2.0.0 
   
* check this stackoverflow post if you encounter some errors:

http://stackoverflow.com/questions/17257830/error-when-installing-ruby-requirements-osx-port-install-port
    
### Messge of install

    limingth@gmail ~$ rvm install 2.0.0
    Searching for binary rubies, this might take some time.
    Found remote file https://rvm.io/binaries/osx/10.8/x86_64/ruby-2.0.0-p247.tar.bz2
    Checking requirements for osx.
    Installing macports...................................................................................................................
    Error running 'requirements_osx_port_install_port',
    please read /Users/limingth/.rvm/log/1383880139_ruby-2.0.0-p247/port_install.log
    Requirements installation failed with status: 1.
    mingmatoMacBook-Air:~ limingth$ rvm install 2.0.0
    Searching for binary rubies, this might take some time.
    No binary rubies available for: osx/10.8/x86_64/ruby-2.0.0-p247.
    Continuing with compilation. Please read 'rvm help mount' to get more information on binary rubies.
    Checking requirements for osx.
    Installing macports..........................................................................................................................................................................................................................................................................................................................limingth password required for 'make install': 
    ....
    ..................................................................................................................................................................................................................................
    Installing requirements for osx.
    Updating system....................................................
    Installing required packages: autoconf, automake, libtool, pkgconfig, libiconv, libyaml, libffi, readline, libksba, openssl, curl-ca-bundle, sqlite3, zlib, gdbm, ncurses.......................................................................................................................................................
    Updating certificates in '/opt/local/etc/openssl/cert.pem'.
    Requirements installation successful.
    Installing Ruby from source to: /Users/limingth/.rvm/rubies/ruby-2.0.0-p247, this may take a while depending on your cpu(s)...
    ruby-2.0.0-p247 - #downloading ruby-2.0.0-p247, this may take a while depending on your connection...
    ######################################################################## 100.0%
    ruby-2.0.0-p247 - #extracting ruby-2.0.0-p247 to /Users/limingth/.rvm/src/ruby-2.0.0-p247
    ruby-2.0.0-p247 - #extracted to /Users/limingth/.rvm/src/ruby-2.0.0-p247
    Applying patch /Users/limingth/.rvm/patches/ruby/2.0.0/logging.patch....
    ruby-2.0.0-p247 - #configuring......................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
    ruby-2.0.0-p247 - #post-configuration
    ruby-2.0.0-p247 - #compiling...........................................................
    ...................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
    ...............
    ruby-2.0.0-p247 - #installing..........................................................................................................
    ...........................................
    Retrieving rubygems-2.1.10
    ######################################################################## 100.0%
    Extracting rubygems-2.1.10 ...
    Removing old Rubygems files...
    Installing rubygems-2.1.10 for ruby-2.0.0-p247..................................................................................................................................................................................................................
    Installation of rubygems completed successfully.
    Saving wrappers to '/Users/limingth/.rvm/wrappers/ruby-2.0.0-p247'........
    
    ruby-2.0.0-p247 - #adjusting #shebangs for (gem irb erb ri rdoc testrb rake).
    ruby-2.0.0-p247 - #importing default gemsets, this may take time................
    Install of ruby-2.0.0-p247 - #complete 
    Ruby was built without documentation, to build it run: rvm docs generate-ri
    
    limingth@Air ~/Github$ rvm install 2.0.0
    Already installed ruby-2.0.0-p247.
    To reinstall use:
    
        rvm reinstall 2.0.0
    
    limingth@gmail ~$ 
    

### Run rvm in shell

    limingth@gmail ~$ rvm
    = rvm
    
    * https://rvm.io/
    * https://github.com/wayneeseguin/rvm/
    
    == DESCRIPTION:
    
    RVM is the Ruby enVironment Manager (rvm).
    
    It manages Ruby application environments and enables switching between them.
    
    == Installation
    
      curl -L https://get.rvm.io | bash -s stable --autolibs=enabled [--ruby] [--rails] [--trace]
    
    stable     :: Install stable RVM, good for servers.
    --ruby     :: Additionally install latest ruby version (MRI).
    --rails    :: Install gem rails into default gemset (also installs ruby=).
    --trace    :: Print trace of the installation, gist output when you have problems.
    --autolibs :: Enable or disable autolibs see: https://rvm.io/rvm/autolibs
    
    More details here: https://rvm.io/rvm/install/
    
    == Usage
    
      rvm [Flags] [Options] Action [Implementation[,Implementation[,...]]
    
    == Flags
    
    --default         :: with 'rvm use X', sets the default ruby for new shells to X.
    --debug           :: Toggle debug mode on for very verbose output.
    --disable-binary  :: Install from source instead of using binaries
    --trace           :: Toggle trace mode on to see EVERYTHING rvm is doing.
    --force           :: Force install, removes old install & source before install.
    --summary         :: Used with rubydo to print out a summary of the commands run.
    --latest          :: with gemset --dump skips version strings for latest gem.
    --gems            :: with uninstall/remove removes gems with the interpreter.
    --docs            :: with install, attempt to generate ri after installation.
    --reconfigure     :: Force ./configure on install even if Makefile already exists.
    --skip-gemsets    :: with install, skip the installation of default gemsets.
    --quiet-curl      :: Makes curl silent when fetching data
    
    == Options
    
    -v|--version     :: Emit rvm version loaded for current shell
    -l|--level       :: patch level to use with rvm use / install
       --bin         :: path for binaries to be placed (~/.rvm/bin/)
    -S               :: Specify a script file to attempt to load and run (rubydo)
    -e               :: Execute code from the command line.
    --gems           :: Used to set the 'gems_flag', use with 'remove' to remove
                        gems
    --archive        :: Used to set the 'archive_flag', use with 'remove' to remove
                        archive
    --patch          :: With MRI Rubies you may specify one or more full paths to
                        patches
    
                        for multiple, specify comma separated:
    
                          --patch /.../.../a.patch[%prefix],/.../.../.../b.patch
    
                        'prefix' is an optional argument, which will be bypassed
                        to the '-p' argument of the 'patch' command. It is separated
                        from patch file name with '%' symbol.
    -C|--configure   :: custom configure options. If you need to pass several
                        configure options then append them comma separated:
    
                          -C --...,--...,--...
    
    --nice           :: process niceness (for slow computers, default 0)
    --ree-options    :: Options passed directly to ree's './installer' on the
                        command line.
    --with-rubies    :: Specifies a string for rvm to attempt to expand for set
                        operations.
    
    == Action
    
    (Note: for most actions, 'rvm help action-name' may provide more information.)
    
    *usage*     :: show this usage information
    version     :: show the rvm version installed in rvm_path
    use         :: setup current shell to use a specific ruby version
    reload      :: reload rvm source itself (useful after changing rvm source)
    implode     :: (seppuku) removes the rvm installation completely.
    
                   This means everything in $rvm_path (~/.rvm || /usr/local/rvm).
    
                   This does not touch your profiles. However, this means that you
                   must manually clean up your profiles and remove the lines which
                   source RVM.
    get         :: {head,stable} upgrades rvm to latest head or stable version.
    
                   Check 'rvm help get' for more details.
    
                   (If you experience bugs try this first with head version, then
                   ask for help in #rvm on irc.freenode.net and hang around)
    reset       :: remove current and stored default & system settings.
    
                   (If you experience odd behavior try this second)
    info        :: show the *current* environment information for current ruby
    current     :: print the *current* ruby version and the name of any gemset
                   being used.
    debug       :: show info plus additional information for common issues
    
    install     :: install one or many ruby versions
    
                   See also: https://rvm.io/rubies/installing/
    uninstall   :: uninstall one or many ruby versions, leaves their sources
    remove      :: uninstall one or many ruby versions and remove their sources
    reinstall   :: reinstall ruby and runs gem pristine on all gems,
                   make sure to read output, use 'all' for all rubies.
    
    migrate     :: Lets you migrate all gemsets from one ruby to another.
    upgrade     :: Lets you upgrade from one version of a ruby to another, including
                   migrating your gemsets semi-automatically.
    
    wrapper     :: generates a set of wrapper executables for a given ruby with the
                   specified ruby and gemset combination. Used under the hood for
                   passenger support and the like.
    
    cleanup     :: Lets you remove stale source folders / archives and other
                   miscellaneous data associated with rvm.
    repair      :: Lets you repair parts of your environment e.g. wrappers, env
                   files and and similar files (e.g. general maintenance).
    snapshot    :: Lets you backup / restore an rvm installation in a lightweight
                   manner.
    
    disk-usage  :: Tells you how much disk space rvm install is using.
    tools       :: Provides general information about the ruby environment,
                   primarily useful when scripting rvm.
    docs        :: Tools to make installing ri and rdoc documentation easier.
    rvmrc       :: Tools related to managing rvmrc trust and loading.
    
    do          :: runs an arbitrary command against specified and/or all rubies
    tests       :: runs 'rake test' across selected ruby versions
    specs       :: runs 'rake spec' across selected ruby versions
    monitor     :: Monitor cwd for testing, run `rake {spec,test}` on changes.
    
    gemset      :: gemsets: https://rvm.io/gemsets/
    
    rubygems    :: Switches the installed version of rubygems for the current ruby.
    
    gemdir      :: display the path to the current gem directory (GEM_HOME).
    srcdir      :: display the path to rvm source directory (may be yanked)
    
    fetch       :: Performs an archive / src fetch only of the selected ruby.
    list        :: show currently installed rubies, interactive output.
    
                   https://rvm.io/rubies/list/
    pkg         :: Install a dependency package {readline,iconv,zlib,openssl}
    
                   https://rvm.io/packages/
    notes       :: Display notes, with operating system specifics.
    
    export      :: Temporarily set an environment variable in the current shell.
    unexport    :: Undo changes made to the environment by 'rvm export'.
    requirements  :: Shows additional OS specific dependencies/requirements for
                     building various rubies.
    mount       :: Install rubies from external locations 'rvm help mount'.
    
    == Implementation
    
    *ruby*     :: MRI/YARV Ruby (The Gold Standard) {1.8.6,1.8.7,1.9.1,1.9.2...}
    jruby      :: JRuby, Ruby interpreter on the Java Virtual Machine.
    rbx        :: Rubinius
    ree        :: Ruby Enterprise Edition, MRI Ruby with several custom
                  patches for performance, stability, and memory.
    macruby    :: MacRuby, insanely fast, can make real apps (Mac OS X Only).
    maglev     :: GemStone Ruby, awesome persistent ruby object store.
    ironruby   :: IronRuby, NOT supported yet. Looking for volunteers to help.
    system     :: use the system ruby (eg. pre-rvm state)
    default    :: use the default ruby (or the system ruby if a default hasn't been set).
    
                  https://rvm.io/rubies/default/
    
    == Resources:
    
    https://rvm.io/
    https://www.pivotaltracker.com/projects/26822
    
    == Contributions:
    
    Any and all contributions offered in any form, past present or future, to the
    RVM project are understood to be in complete agreement and acceptance with the
    Apache License v2.0.
    
    == LICENSE:
    
    Copyright (c) 2009-2011 Wayne E. Seguin
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    
      Commands available with 'rvm help':
    
          alias.md alt.md autolibs.md benchmark.md build.md cleanup.md color.md config-get.md cron.md current.md debug.md disk-usage.md do.md docs.md fetch.md fix-permissions.md gemdir.md gemset.md get.md implode.md info.md install.md list.md migrate.md monitor.md mount.md notes.md osx-ssl-certs.md pkg.md rake.md reinstall.md remove.md repair.md reset.md ruby.md rubygems.md rvmrc.md snapshot.md specs.md srcdir.md tests.md tools.md uninstall.md update.md upgrade-notes.txt upgrade.md use.md user.md wrapper.md 
      
    
      For additional information please visit RVM's documentation website:
    
          https://rvm.io/
    
      If you still cannot find what an answer to your question, find
      'wayneeseguin', 'mpapis', 'richo', 'lemoinem' or 'rys' in #rvm on irc.freenode.net:
    
          http://webchat.freenode.net/?channels=rvm
      
    limingth@gmail ~$ 
    
### install rails

    limingth@gmail ~$ sudo gem install rails
Password:

Building native extensions.  This could take a while...
ERROR:  Error installing rails:
	activesupport requires Ruby version >= 1.9.3.
limingth@gmail ~$ 

#### change ruby links
    
    limingth@gmail ~$ ruby -v
    ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]

    limingth@gmail ~$ which ruby
    /usr/bin/ruby
    
    limingth@gmail ~$ which ruby-2.0.0-p247
    /Users/limingth/.rvm/bin/ruby-2.0.0-p247
    
    limingth@gmail ~$ sudo mv /usr/bin/ruby /usr/bin/ruby-1.8.7
    Password:
    limingth@gmail ~$ sudo ln -s /Users/limingth/.rvm/bin/ruby-2.0.0-p247 /usr/bin/ruby

    limingth@gmail ~$ ruby -v
    ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]

### Install rails
    
    limingth@gmail ~$ sudo gem install rails
    Password:
    ERROR:  Error installing rails:
    	activesupport requires Ruby version >= 1.9.3.
    limingth@gmail ~$ 
    
**stucked here**

### Install rails AGAIN
	
	limingth@gmail ~/myRoR$ sudo gem install rails
	Password:
	Fetching: activerecord-deprecated_finders-1.0.3.gem (100%)
	Successfully installed activerecord-deprecated_finders-1.0.3
	Fetching: activerecord-4.0.1.gem (100%)
	Successfully installed activerecord-4.0.1
	Fetching: mime-types-1.25.gem (100%)
	Successfully installed mime-types-1.25
	Fetching: polyglot-0.3.3.gem (100%)
	Successfully installed polyglot-0.3.3
	Fetching: treetop-1.4.15.gem (100%)
	Successfully installed treetop-1.4.15
	Fetching: mail-2.5.4.gem (100%)
	Successfully installed mail-2.5.4
	Fetching: actionmailer-4.0.1.gem (100%)
	Successfully installed actionmailer-4.0.1
	Fetching: thor-0.18.1.gem (100%)
	Successfully installed thor-0.18.1
	Fetching: railties-4.0.1.gem (100%)
	Successfully installed railties-4.0.1
	Fetching: hike-1.2.3.gem (100%)
	Successfully installed hike-1.2.3
	Fetching: tilt-1.4.1.gem (100%)
	Successfully installed tilt-1.4.1
	Fetching: sprockets-2.10.0.gem (100%)
	Successfully installed sprockets-2.10.0
	Fetching: sprockets-rails-2.0.1.gem (100%)
	Successfully installed sprockets-rails-2.0.1
	Fetching: rails-4.0.1.gem (100%)
	Successfully installed rails-4.0.1
	Parsing documentation for actionmailer-4.0.1
	Installing ri documentation for actionmailer-4.0.1
	Parsing documentation for activerecord-4.0.1
	Installing ri documentation for activerecord-4.0.1
	Parsing documentation for activerecord-deprecated_finders-1.0.3
	Installing ri documentation for activerecord-deprecated_finders-1.0.3
	Parsing documentation for hike-1.2.3
	Installing ri documentation for hike-1.2.3
	Parsing documentation for mail-2.5.4
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for lib/mail/values/unicode_tables.dat, skipping
	Installing ri documentation for mail-2.5.4
	Parsing documentation for mime-types-1.25
	Installing ri documentation for mime-types-1.25
	Parsing documentation for polyglot-0.3.3
	Installing ri documentation for polyglot-0.3.3
	Parsing documentation for rails-4.0.1
	unable to convert "\xFF" from ASCII-8BIT to UTF-8 for guides/assets/images/akshaysurve.jpg, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/belongs_to.png, skipping
	unable to convert "\xF4" from ASCII-8BIT to UTF-8 for guides/assets/images/book_icon.gif, skipping
	unable to convert "\x91" from ASCII-8BIT to UTF-8 for guides/assets/images/bullet.gif, skipping
	unable to convert "\xF5" from ASCII-8BIT to UTF-8 for guides/assets/images/chapters_icon.gif, skipping
	unable to convert "\xF5" from ASCII-8BIT to UTF-8 for guides/assets/images/check_bullet.gif, skipping
	unable to convert "\xF4" from ASCII-8BIT to UTF-8 for guides/assets/images/credits_pic_blank.gif, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/csrf.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/edge_badge.png, skipping
	unable to convert "\x9E" from ASCII-8BIT to UTF-8 for guides/assets/images/favicon.ico, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/feature_tile.gif, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/footer_tile.gif, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/fxn.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/challenge.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/confirm_dialog.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/forbidden_attributes_for_new_post.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/form_with_errors.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/index_action_with_edit_link.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/new_post.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/post_with_comments.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/rails_welcome.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/routing_error_no_controller.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/routing_error_no_route_matches.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/show_action_for_posts.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/template_is_missing_posts_new.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/undefined_method_post_path.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/unknown_action_create_for_posts.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/getting_started/unknown_action_new_for_posts.png, skipping
	unable to convert "\xF0" from ASCII-8BIT to UTF-8 for guides/assets/images/grey_bullet.gif, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/habtm.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/has_many.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/has_many_through.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/has_one.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/has_one_through.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/header_backdrop.png, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/header_tile.gif, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/i18n/demo_html_safe.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/i18n/demo_localized_pirate.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/i18n/demo_translated_en.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/i18n/demo_translated_pirate.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/i18n/demo_translation_missing.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/i18n/demo_untranslated.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/1.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/10.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/11.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/12.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/13.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/14.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/15.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/2.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/3.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/4.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/5.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/6.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/7.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/8.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/callouts/9.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/caution.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/example.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/home.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/important.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/next.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/note.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/prev.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/tip.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/up.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/icons/warning.png, skipping
	unable to convert "\xFF" from ASCII-8BIT to UTF-8 for guides/assets/images/jaimeiniesta.jpg, skipping
	unable to convert "\xF5" from ASCII-8BIT to UTF-8 for guides/assets/images/nav_arrow.gif, skipping
	unable to convert "\xFF" from ASCII-8BIT to UTF-8 for guides/assets/images/oscardelben.jpg, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/polymorphic.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/radar.png, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/rails4_features.png, skipping
	unable to convert "\xFF" from ASCII-8BIT to UTF-8 for guides/assets/images/rails_guides_kindle_cover.jpg, skipping
	unable to convert "\xEC" from ASCII-8BIT to UTF-8 for guides/assets/images/rails_guides_logo.gif, skipping
	unable to convert "\x8C" from ASCII-8BIT to UTF-8 for guides/assets/images/rails_logo_remix.gif, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/session_fixation.png, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/tab_grey.gif, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/tab_info.gif, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/tab_note.gif, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/tab_red.gif, skipping
	unable to convert "\x80" from ASCII-8BIT to UTF-8 for guides/assets/images/tab_yellow.gif, skipping
	unable to convert "\x89" from ASCII-8BIT to UTF-8 for guides/assets/images/tab_yellow.png, skipping
	unable to convert "\xFF" from ASCII-8BIT to UTF-8 for guides/assets/images/vijaydev.jpg, skipping
	Installing ri documentation for rails-4.0.1


### Test 'rails' command
	
	limingth@gmail ~/myRoR$ rails
	Usage:
	  rails new APP_PATH [options]
	
	Options:
	  -r, [--ruby=PATH]              # Path to the Ruby binary of your choice
	                                 # Default: /Users/limingth/.rvm/rubies/ruby-2.0.0-p247/bin/ruby
	  -m, [--template=TEMPLATE]      # Path to some application template (can be a filesystem path or URL)
	      [--skip-gemfile]           # Don't create a Gemfile
	  -B, [--skip-bundle]            # Don't run bundle install
	  -G, [--skip-git]               # Skip .gitignore file
	      [--skip-keeps]             # Skip source control .keep files
	  -O, [--skip-active-record]     # Skip Active Record files
	  -S, [--skip-sprockets]         # Skip Sprockets files
	  -d, [--database=DATABASE]      # Preconfigure for selected database (options: mysql/oracle/postgresql/sqlite3/frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)
	                                 # Default: sqlite3
	  -j, [--javascript=JAVASCRIPT]  # Preconfigure for selected JavaScript library
	                                 # Default: jquery
	  -J, [--skip-javascript]        # Skip JavaScript files
	      [--dev]                    # Setup the application with Gemfile pointing to your Rails checkout
	      [--edge]                   # Setup the application with Gemfile pointing to Rails repository
	  -T, [--skip-test-unit]         # Skip Test::Unit files
	      [--rc=RC]                  # Path to file containing extra configuration options for rails command
	      [--no-rc]                  # Skip loading of extra configuration options from .railsrc file
	
	Runtime options:
	  -f, [--force]    # Overwrite files that already exist
	  -p, [--pretend]  # Run but do not make any changes
	  -q, [--quiet]    # Suppress status output
	  -s, [--skip]     # Skip files that already exist
	
	Rails options:
	  -h, [--help]     # Show this help message and quit
	  -v, [--version]  # Show Rails version number and quit
	
	Description:
	    The 'rails new' command creates a new Rails application with a default
	    directory structure and configuration at the path you specify.
	
	    You can specify extra command-line arguments to be used every time
	    'rails new' runs in the .railsrc configuration file in your home directory.
	
	    Note that the arguments specified in the .railsrc file don't affect the
	    defaults values shown above in this help message.
	
	Example:
	    rails new ~/Code/Ruby/weblog
	
	    This generates a skeletal Rails installation in ~/Code/Ruby/weblog.
	    See the README in the newly created application to get going.

