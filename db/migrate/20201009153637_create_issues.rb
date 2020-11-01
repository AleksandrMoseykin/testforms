class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :img
      t.integer :idreg
      t.references :taskform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
