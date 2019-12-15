namespace :github_stats do
  desc "populate users stats"
  task populate: :environment do
    three_weeks_range = [
        {
          from_date: DateTime.current.beginning_of_week - 3.week,
          to_date: DateTime.current.beginning_of_week - 2.week
        },
        {
          from_date: DateTime.current.beginning_of_week - 2.week,
          to_date: DateTime.current.beginning_of_week - 1.week
        },
        {
            from_date: DateTime.current.beginning_of_week - 1.week,
            to_date: DateTime.current.beginning_of_week - 0.week
        },
    ]

    three_weeks_range.each{ |data_rage|
      GithubUserStatistics::CollectStatsForDateRange.new(data_rage).perform!
    }
  end

  task recurrent: :environment do
    GithubUserStatistics::CollectStatsForDateRange.new(
        from_date: DateTime.current.beginning_of_week - 1.week,
        to_date: DateTime.current
    ).perform!
  end
end
