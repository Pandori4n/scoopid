class SearchParty < ApplicationRecord
  belongs_to :lost_person

  has_one :lost_person

  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
  validates :meeting_location, presence: true
  validates :radius, presence: true
end
