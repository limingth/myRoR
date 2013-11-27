
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





















