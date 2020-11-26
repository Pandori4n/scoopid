class Chatroom < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :volunteer, class_name: 'User'

  has_many :messages
end
