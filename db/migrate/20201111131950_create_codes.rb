class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.text :pasanswer
      t.integer :pascount
      t.text :pasvalue
      t.integer :userid
      t.references :taskform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
