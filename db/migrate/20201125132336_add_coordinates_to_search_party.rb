class AddCoordinatesToSearchParty < ActiveRecord::Migration[6.0]
  def change
    add_column :search_parties, :latitude, :float
    add_column :search_parties, :longitude, :float
  end
end
