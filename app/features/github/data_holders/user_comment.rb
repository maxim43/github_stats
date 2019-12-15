module Github
  module DataHolders
    class UserComment < Struct.new(:user_url, :created_at)

      # see https://developer.github.com/v3/pulls/comments/
      def initialize(pull_request_comment:)
        user_url   = pull_request_comment.user.url
        created_at = pull_request_comment.created_at

        super(user_url, created_at)
      end

    end
  end
end
