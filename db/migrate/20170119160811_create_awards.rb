class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
