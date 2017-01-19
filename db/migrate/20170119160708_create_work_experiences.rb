class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.string :company_name
      t.string :title
      t.string :start_date
      t.string :end_date
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end