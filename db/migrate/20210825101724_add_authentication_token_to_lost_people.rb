class AddAuthenticationTokenToLostPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :lost_people, :authentication_token, :string, limit: 7
    add_index :lost_people, :authentication_token, unique: true
  end
end
