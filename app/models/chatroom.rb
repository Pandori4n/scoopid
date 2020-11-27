class Chatroom < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :volunteer, class_name: 'User'
  belongs_to :lost_person

  has_many :messages
end
