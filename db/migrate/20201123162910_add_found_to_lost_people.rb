class AddFoundToLostPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :lost_people, :found, :boolean, default: false
  end
end
