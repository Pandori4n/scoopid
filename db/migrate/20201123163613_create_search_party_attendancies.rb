class CreateSearchPartyAttendancies < ActiveRecord::Migration[6.0]
  def change
    create_table :search_party_attendancies do |t|
      t.json :itinerary, null: false, default: '{}'
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.references :user, null: false, foreign_key: true
      t.references :search_party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
