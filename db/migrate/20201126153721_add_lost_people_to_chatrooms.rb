class AddLostPeopleToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :lost_person, null: false, foreign_key: true
  end
end
