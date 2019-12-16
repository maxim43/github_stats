module Github
  module Services
    #WARNING.. REVIEW CAN BE MISSING IF IT IS MADE LATTER THEN PULL REQUEST CREATED
    # THERE ARE NO ENDPOINTS TO GET ALL REVIEWS
    # SUGGESTIONS: Use webhooks
    # SUGGESTION: Get all pull more then one week duration
    class StatsCollector

      DEFAULT_REPO_NAME = "MaksymTo/tamagotchi"

      attr_reader :from_date
      attr_reader :to_date

      def initialize(from_date:, to_date:)
        @from_date = from_date
        @to_date   = to_date
      end

      # @return Array<Github::DataHolders::UserPullRequest>
      def pull_requests
        @pull_requests ||= github_api
                             .pull_requests(since_date: from_date)
                             .map{ |pull_request_resp|
                               Github::DataHolders::UserPullRequest.new(pull_request: pull_request_resp)
                             }
                             .select { |pull_request| pull_request.created_at < to_date }
      end

      # return Array<Github::DataHolders::UserReview>
      def pull_request_reviews
        pull_request_numbers = pull_requests.map { |pull_request| pull_request.pull_request_number }

        @pull_request_reviews ||= pull_request_numbers
                                    .map { |pr_number| github_api.pull_request_reviews(pr_number) }
                                    .flatten
                                    .map { |review_resp|
                                      Github::DataHolders::UserReview.new(pull_request_review: review_resp)
                                    }
                                    .select { |pull_request| pull_request.created_at < to_date }
      end

      # @return Array<Github::DataHolders::UsersComment>
      def pull_requests_comments
        @pull_requests_comments ||= github_api
                                      .pull_requests_comments(since_date: from_date)
                                      .map { |comments_resp|
                                        Github::DataHolders::UserComment.new(pull_request_comment: comments_resp)
                                      }
                                      .select { |pull_request| pull_request.created_at < to_date }
      end

      private

      def github_api
        @github_api ||= Github::Api.new(repo_path: DEFAULT_REPO_NAME)
      end
    end
  end
end
