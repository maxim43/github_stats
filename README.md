# README

Set up:

* Run `bundle install` to install gems
* Run `docker-compose up` in `/config` in order to run postgres 
* Run db migration `bundle exec rails db:migrate`
* use `bundle exec whenever --update-crontab` to start background jobs 
* Note: See `log/whenever.log` for any background jobs error
* Run `crontab -e` and change `RAILS_ENV` to `development` in order to run background jobs in dev env  
* Optional: use `bundle exec whenever --clear-crontab` to clear cron jobs
* Run `bundle exec rake github_stats:populate` if you want to prepopulate historical stats for previous 3 weeks
* Run `rails s` to start dev server
* check `localhost:3000/api/users-statistics` to see the best dev last week
