class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.integer :numberrand
      t.integer :userid
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
