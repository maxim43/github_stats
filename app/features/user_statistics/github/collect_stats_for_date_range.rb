module UserStatistics
  module Github
    class CollectStatsForDateRange
      attr_reader :from_date
      attr_reader :to_date

      def initialize(from_date:, to_date:)
        @from_date = from_date
        @to_date = to_date
      end

      def perform!
        begin
          stats_collector = ::Github::Services::StatsCollector.new(
              from_date: from_date,
              to_date: to_date
          )

          users_stats = ::Github::Services::StatsAggregator
                            .new(stats_collector: stats_collector)
                            .get_stats_per_user

          ActiveRecord::Base.transaction do
            users_stats.each do |users_stat|
              ::UserStatistics::Github::Create.new(users_stat, from_date.to_date).perform!
            end
          end
            #  TODO: Use Application logger
        rescue => e
          puts e
        end
      end
    end
  end
end
