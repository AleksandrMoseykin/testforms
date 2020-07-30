class CreateUsertabls < ActiveRecord::Migration[6.0]
  def change
    create_table :usertabls do |t|
      t.integer :userid
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
