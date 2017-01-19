class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :role
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
