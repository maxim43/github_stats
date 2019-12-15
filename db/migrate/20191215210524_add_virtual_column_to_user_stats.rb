class AddVirtualColumnToUserStats < ActiveRecord::Migration[6.0]
  def up

    sql = <<~SQL
      ALTER TABLE user_stats 
        ADD COLUMN stats_score int GENERATED ALWAYS 
          AS (comments_count*#{UserStat::COMMENT_SCORE_POINTS} + 
              reviews_count*#{UserStat::REVIEW_SCORE_POINTS} +  
              pull_request_count*#{UserStat::PULL_REQUEST_SCORE_POINTS}) 
          STORED
    SQL

    ActiveRecord::Base.connection.execute(sql)
  end
end
