class CreateLinktasks < ActiveRecord::Migration[6.0]
  def change
    create_table :linktasks do |t|
      t.string :link
      t.integer :idcreator
      t.text :codecreator
      t.integer :userid
      t.string :viewlinks

      t.timestamps
    end
  end
end
