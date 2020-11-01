class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :idvisitor
      t.integer :idcreator
      t.text :codecreator

      t.timestamps
    end
  end
end
