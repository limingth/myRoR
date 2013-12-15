
## Second Feature: retwet

### get a basic idea of what retwet looks like 
	limingth@gmail ~/Github/twetter$ git branch
	* master
	  myProfileBranch
	limingth@gmail ~/Github/twetter$ git branch -r
	  origin/HEAD -> origin/master
	  origin/complete
	  origin/gravatar
	  origin/master
	  origin/myProfileBranch
	  origin/profile
	  origin/retwet
	limingth@gmail ~/Github/twetter$ git checkout retwet
	Branch retwet set up to track remote branch retwet from origin.
	Switched to a new branch 'retwet'
	limingth@gmail ~/Github/twetter$ 

### restart rails server and view the pages http://localhost:3000/twets
	limingth@gmail ~/Github/twetter$ rake db:migrate RAILS_ENV=development
	==  CreateRetweets: migrating =================================================
	-- create_table(:retweets)
	   -> 0.0119s
	-- add_index(:retweets, [:tweet_id, :user_id])
	   -> 0.0009s
	==  CreateRetweets: migrated (0.0132s) ========================================

	==  ChangeRetweetToRetwet: migrating ==========================================
	-- rename_column(:retwets, :tweet_id, :twet_id)
	   -> 0.0150s
	==  ChangeRetweetToRetwet: migrated (0.0247s) =================================

	limingth@gmail ~/Github/twetter$ rails s
	=> Booting WEBrick
	=> Rails 4.0.0 application starting in development on http://0.0.0.0:3000
	=> Run `rails server -h` for more startup options
	=> Ctrl-C to shutdown server
	[2013-12-14 20:09:32] INFO  WEBrick 1.3.1
	[2013-12-14 20:09:32] INFO  ruby 2.0.0 (2013-06-27) [x86_64-darwin12.4.0]
	[2013-12-14 20:09:32] INFO  WEBrick::HTTPServer#start: pid=3983 port=3000

![twetter-retwet-looks-like](twetter-retwet-looks-like.png)

### sign up another user like @test, follow user limingth, then you see his retwets
![twetter-retwet-show](twetter-retwet-show.png)

## Now write code to implement that feature
### Step 0 - make sure you create a new branch myRetwet
	limingth@gmail ~/Github/twetter$ git checkout master
	Switched to branch 'master'
	limingth@gmail ~/Github/twetter$ git checkout -b myRetwet
	Switched to a new branch 'myRetwet'
	limingth@gmail ~/Github/twetter$ 

### Step 1 - add Retwet button to every twet 
	limingth@gmail ~/Github/twetter$ vi app/views/twets/index.html.erb 
	 14       <% @twets.each do |twet| -%>
	 15       <li>
	 16         <%= content_tag :strong, twet.user.name, :class => 'pull-left text-middle' %>
	 17         <a href="<%= twet.user.username %>" color='blue'><%= content_tag :small, "@"+twet.user.username, :class => 'text-muted pad-10 text-mi    ddle' %></a>
	 18         <%= content_tag :small, twet.created_at.strftime("%b %-d"), :class => 'text-muted text-middle pull-right' %>
	 19         <div class="clearfix"></div>
	 20         <%= content_tag :p, twet.content.gsub(/@(?<username>(\w+))/, '<a href="'+'\k<username>'+'">@\k<username></a>').html_safe %>
	 21         
	 22         <div class="clearfix"></div>
	 23           <%= content_tag :div, :class => 'pull-right' do %>
	 24             <%= form_for :retwet, :url => 'retwets_path', 
	 25                                    :method => 'POST',
	 26                                    :role => :form do |f| %>
	 27               <%= hidden_field_tag :return_to, request.original_url %>
	 28               <%= f.hidden_field :twet_id, :value => twet.id.to_s %>
	 29               <span class="glyphicon glyphicon-retweet smaller text-primary"></span>
	 30               <%= f.submit "Retwet".html_safe, :class => 'btn btn-link smaller' %>
	 31             <% end %>
	 32           <% end %>
	 33         <div class="clearfix"></div>
	 34         
	 35       </li>
	 36       <li><hr></li>
	 37       <% end -%>

![twetter-retwet-add-button](twetter-retwet-add-button.png)
