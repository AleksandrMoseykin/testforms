class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.integer :agebefore
      t.integer :ageafter
      t.integer :counttrue
      t.text :accomplishment
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
