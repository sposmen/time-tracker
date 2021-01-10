class TimeTrack < ApplicationRecord
  scope :date, ->(date = Time.zone.now.beginning_of_day.utc) { where('date(start_at) = :date', date: date.to_date) }
  scope :between, lambda { |date_range|
    time_track = TimeTrack.arel_table
    where(time_track[:start_at].between(date_range))
  }
end
