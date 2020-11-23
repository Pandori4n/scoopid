class SearchPartyAttendancy < ApplicationRecord
  belongs_to :user
  belongs_to :search_party

  has_many :users
  has_one :search_party
end
