class AddColumnToLostPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :lost_people, :code, :string
  end
end
