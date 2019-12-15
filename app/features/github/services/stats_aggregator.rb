module Github
  module Services
    class StatsAggregator

      attr_reader :pull_requests
      attr_reader :pull_request_reviews
      attr_reader :pull_requests_comments

      # @param stats_collector [#pull_requests] [#pull_request_reviews]  [#pull_requests_comments]
      def initialize(stats_collector:)
        @pull_requests = stats_collector.pull_requests
        @pull_request_reviews = stats_collector.pull_request_reviews
        @pull_requests_comments = stats_collector.pull_requests_comments
      end

      #@return Array<Github::DataHolders::UserStats>
      def get_stats_per_user
        user_stats = {}

        # TODO: user #send method
        pull_requests.each do |pr|
          user_stats[pr.user_url] ||= Github::DataHolders::UserStats.new(user_url: pr.user_url)
          user_stats[pr.user_url].pull_requests +=1
        end

        pull_request_reviews.each do |pr|
          user_stats[pr.user_url] ||= Github::DataHolders::UserStats.new(user_url: pr.user_url)
          user_stats[pr.user_url].reviews +=1
        end

        pull_requests_comments.each do |pr|
          user_stats[pr.user_url] ||= Github::DataHolders::UserStats.new(user_url: pr.user_url)
          user_stats[pr.user_url].comments +=1
        end

        user_stats.map{|key, user_stats| user_stats }
      end
    end
  end
end
