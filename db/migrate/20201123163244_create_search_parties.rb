class CreateSearchParties < ActiveRecord::Migration[6.0]
  def change
    create_table :search_parties do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.string :meeting_location
      t.text :description
      t.integer :radius
      t.references :lost_person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
