class CreateCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :creators do |t|
      t.string :namecreator
      t.string :surnamecreator
      t.string :telephonecreator
      t.string :emailcreator
      t.string :companycreator
      t.string :promocodecreator

      t.timestamps
    end
  end
end
