class SearchParty < ApplicationRecord
  belongs_to :lost_person
  has_many :search_party_attendancies

  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
  validates :meeting_location, presence: true
  validates :radius, presence: true

  geocoded_by :meeting_location
  after_validation :geocode, if: :will_save_change_to_meeting_location?
end
