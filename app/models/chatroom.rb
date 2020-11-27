class Chatroom < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :volunteer, class_name: 'User'
  belongs_to :lost_person

  has_many :messages

  validate :existing_chatroom

  private

  def existing_chatroom
    if Chatroom.find_by(host: :host, volunteer: :volunteer, lost_person: :lost_person)
      chatroom = Chatroom.find_by(host: :host, volunteer: :volunteer, lost_person: :lost_person)
      errors.add("existing chatroom: #{chatroom}")
    end
  end
  
end
