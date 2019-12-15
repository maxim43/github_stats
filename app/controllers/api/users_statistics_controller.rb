module Api
  class UsersStatisticsController < ApplicationController
    def index
      top_users_last_week = UserStat.get_top
      json_success(GithubUserStatistics::Presenter.items_json(top_users_last_week))
    end
  end
end