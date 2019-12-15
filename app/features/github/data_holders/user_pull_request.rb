module Github
  module DataHolders
    class UserPullRequest < Struct.new(:user_url, :created_at, :pull_request_number)

      # see https://developer.github.com/v3/pulls/
      def initialize(pull_request:)
        user_url   = pull_request.user.url
        created_at = pull_request.created_at
        number     = pull_request.number

        super(user_url, created_at, number)
      end

    end
  end
end
