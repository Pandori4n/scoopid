class FeedInfo < ApplicationRecord
  belongs_to :user
  belongs_to :lost_person

  validates :title, presence: true
  validates :description, presence: true
end
