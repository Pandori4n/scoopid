class CreateLostPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :lost_people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :last_known_location
      t.text :last_known_clothes
      t.integer :height
      t.string :body_type
      t.text :description
      t.datetime :disparition_date_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
