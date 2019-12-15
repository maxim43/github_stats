# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
ENV['RAILS_ENV'] ||= 'development'
 env "GEM_HOME", '/home/maksymto/.rvm/gems/ruby-2.6.3@githubscore'
 set :output, "log/whenever.log"
 every 1.minute do
   rake "github_stats:populate"
 end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
