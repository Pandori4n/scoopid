class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :volunteer, null: false
      t.references :host, null: false

      t.timestamps
    end
    add_foreign_key :chatrooms, :users, column: :volunteer_id
    add_foreign_key :chatrooms, :users, column: :host_id

  end
end
