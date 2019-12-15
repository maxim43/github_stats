module Github
  module DataHolders
    class UserReview < Struct.new(:user_url, :created_at)

      # see https://developer.github.com/v3/pulls/reviews/
      def initialize(pull_request_review:)
        user_url   = pull_request_review.user.url
        created_at = pull_request_review.submitted_at

        super(user_url, created_at)
      end

    end
  end
end
