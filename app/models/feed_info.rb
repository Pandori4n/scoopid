class FeedInfo < ApplicationRecord
  belongs_to :user
  belongs_to :lost_person

  has_many :user, through: :feed_infos

  validates :title, presence: true
  validates :description, presence: true
end
