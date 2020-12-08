class CreateAccepts < ActiveRecord::Migration[6.0]
  def change
    create_table :accepts do |t|
      t.integer :userid
      t.timestamp :stoptime
      t.integer :counttrue
      t.integer :totaltime
      t.integer :issuesall
      t.integer :numberrand
      t.references :taskform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
