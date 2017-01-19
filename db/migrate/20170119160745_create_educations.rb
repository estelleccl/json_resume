class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :year
      t.string :school
      t.string :field_of_study
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
