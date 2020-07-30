class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :surname
      t.string :name
      t.integer :age
      t.text :telephone
      t.text :email

      t.timestamps
    end
  end
end
