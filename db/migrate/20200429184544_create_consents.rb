class CreateConsents < ActiveRecord::Migration[6.0]
  def change
    create_table :consents do |t|
      t.integer :userid
      t.integer :creatorid
      t.date :stoptime
      t.integer :counttrue
      t.integer :totaltime
      t.integer :questionsall
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
