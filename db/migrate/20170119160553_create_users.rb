class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :languages, array: true, default: []
      t.string :email
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.string :image
      t.text :about
      t.text :others

      t.timestamps null: false
    end
  end
end