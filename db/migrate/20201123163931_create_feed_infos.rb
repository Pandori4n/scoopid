class CreateFeedInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_infos do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :lost_person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
