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
    


