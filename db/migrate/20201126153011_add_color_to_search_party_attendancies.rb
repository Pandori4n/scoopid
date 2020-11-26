class AddColorToSearchPartyAttendancies < ActiveRecord::Migration[6.0]
  def change
    add_column :search_party_attendancies, :color, :string
  end
end
