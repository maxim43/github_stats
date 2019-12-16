module UserStatistics
  module Github
    class Create
      attr_reader :user_stats
      attr_reader :stats_from_date

      # @param user_stats [Github::DataHolders::UserStats]
      def initialize(user_stats, stats_from_date)
        @user_stats = user_stats
        @stats_from_date = stats_from_date
      end

      def perform!
        user = User.where(user_url: user_stats.user_url).first_or_create!

        UserStat.by_user_and_stats_date_population(user.id, stats_from_date)
            .first_or_create! do |user_stat|
          user_stat.comments_count     = user_stats.comments
          user_stat.pull_request_count = user_stats.pull_requests
          user_stat.reviews_count      = user_stats.reviews
          user_stat.stats_from_date    = stats_from_date
        end

      end
    end
  end
end

