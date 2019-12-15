class AddUserStatRelatedTables < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :user_url
    end

    # Table is not normalized.
    create_table :user_stats do |t|
      t.references :user
      t.date :stats_from_date
      t.integer :comments_count
      t.integer :pull_request_count
      t.integer :reviews_count
    end
  end
end
