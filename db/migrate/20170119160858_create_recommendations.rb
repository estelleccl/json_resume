class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :name
      t.string :position
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
