class LostPerson < ApplicationRecord
  belongs_to :user

  has_many :search_parties
  has_many :feed_infos

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :photo, presence: true
  validates :height, presence: true
  validates :disparition_date_time, presence: true
end
