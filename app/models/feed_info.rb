class FeedInfo < ApplicationRecord
  belongs_to :user
  belongs_to :lost_person
end
