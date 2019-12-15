namespace :github_stats do

  desc "Populate users statistics for 3 weeks"
  task populate: :environment do
    puts 'Start processing "Populate users statistics for 3 weeks"'

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
    puts 'End processing "Populate users statistics for 3 weeks"'
  end

  desc "Populate users statistics for 1 weeks"
  task recurrent: :environment do
    puts 'Start processing "Populate users statistics for 1 weeks"'

    GithubUserStatistics::CollectStatsForDateRange.new(
        from_date: UserStat.user_stats_date_from,
        to_date:   UserStat.user_stats_date_to
    ).perform!

    puts 'End processing "Populate users statistics for 1 weeks"'
  end
end
