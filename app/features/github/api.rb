module Github
  class Api
    DEFAULT_SORT_BY        = 'created_at'
    DEFAULT_SORT_DIRECTION = 'desc'

    attr_reader :repo_path

    def initialize(repo_path:)
      @repo_path = repo_path
    end

    def pull_requests(since_date:, opts: {})
      sort_by        = opts.fetch(:sort_by, DEFAULT_SORT_BY)
      sort_direction = opts.fetch(:sort_direction, DEFAULT_SORT_DIRECTION)

      ::Octokit
          .pull_requests(repo_path, {
            :sort      => sort_by,
            :direction => sort_direction,
            :since     => since_date
          })
    end

    def pull_request_reviews(pull_request_number)
      ::Octokit
          .pull_request_reviews(repo_path, pull_request_number)
    end

    def pull_requests_comments(since_date:, opts: {})
      sort_by        = opts.fetch(:sort_by, DEFAULT_SORT_BY)
      sort_direction = opts.fetch(:sort_direction, DEFAULT_SORT_DIRECTION)

      ::Octokit
          .pull_requests_comments(repo_path, {
            :sort      => sort_by,
            :direction => sort_direction,
            :since     => since_date
          })
    end
  end
end
