class RemoveAuthenticationTokenFromLostPerson < ActiveRecord::Migration[6.0]
  def change
    remove_column :lost_people, :authentication_token, :string
  end
end
