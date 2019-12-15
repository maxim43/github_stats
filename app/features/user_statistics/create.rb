module UserStatistics
  class Create
    # @param user_stats [Github::DataHolders::UserStats]
    def initialize(user_stats)
      @user_stats = user_stats
    end

    def perform!

    end
  end
end