class TimeTrack < ApplicationRecord
  scope :date, ->(date=Date.today) { where('date(start_at) = ?', date) }
end
