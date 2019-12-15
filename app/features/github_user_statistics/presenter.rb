module GithubUserStatistics
  class Presenter
    def self.items_json(items)
      items.map { |item|  item_json(item) }
    end

    def self.item_json(item)
      {
          user_repo_url: item.user.user_url,
          pull_request_count: item.pull_request_count,
          comments_count: item.comments_count,
          reviews_count: item.reviews_count,
          total: item.stats_score
      }
    end
  end
end
