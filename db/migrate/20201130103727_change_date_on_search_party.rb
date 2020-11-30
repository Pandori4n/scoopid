class ChangeDateOnSearchParty < ActiveRecord::Migration[6.0]
  def change
    remove_column :search_parties, :start_date_time, :datetime
    remove_column :search_parties, :end_date_time, :datetime
    add_column :search_parties, :date, :date
    add_column :search_parties, :start_time, :time
    add_column :search_parties, :end_time, :time
  end
end
