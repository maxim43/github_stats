class UserStat < ApplicationRecord
  self.table_name = "user_stats"

  PULL_REQUEST_SCORE_POINTS = 12
  REVIEW_SCORE_POINTS       = 3
  COMMENT_SCORE_POINTS      = 1

  belongs_to :user

  scope :later_then, ->(date) {
    where('stats_from_date >= ?', date)
  }

  scope :by_user_and_stats_date_population, -> (user_id, stats_from_date) {
    later_then(stats_from_date)
        .where(user_id: user_id)
  }
  # stats_score is virtual column
  scope :get_top, ->(top: 5) {
    includes(:user)
        .later_then(user_stats_date_from)
        .order(stats_score: :desc)

  }

  def self.user_stats_date_from
    DateTime.current.beginning_of_week - 1.week
  end

  def self.user_stats_date_to
    DateTime.current.beginning_of_week
  end
end
