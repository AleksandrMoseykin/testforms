class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :surname
      t.string :telephone
      t.datetime :birthdate
      t.string :photo
      t.string :promocode
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
