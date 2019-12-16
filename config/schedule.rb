 # #job_type :rake, "{ cd #{@current_path} > /dev/null; } && RAILS_ENV=:environment bundle exec rake :task --silent :output"
 #
 #env "GEM_HOME", '/home/maksymto/.rvm/gems/ruby-2.6.3@githubscore'
 set :output, "log/whenever.log"

 every :monday, at: "2:00 AM" do
   rake "github_stats:recurrent"
 end
