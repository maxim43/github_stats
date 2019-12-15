module Github
  module DataHolders
    class UserStats < Struct.new(:user_url, :comments, :pull_requests, :reviews )
      def initialize(user_url:, comments: 0, pull_requests: 0, reviews: 0)
        super(user_url, comments, pull_requests, reviews)
      end
    end
  end
end
