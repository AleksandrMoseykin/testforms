class CreatePasswords < ActiveRecord::Migration[6.0]
  def change
    create_table :passwords do |t|
      t.string :pasanswer
      t.string :pasvalue
      t.integer :pascount
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
