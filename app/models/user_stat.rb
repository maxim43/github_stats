class UserStat < ApplicationRecord
  self.table_name = "user_stats"

  scope :by_user_and_stats_date_population, -> (user_id, stats_from_date) {
    where(user_id: user_id).where('stats_from_date >= ?', stats_from_date)
  }
end
