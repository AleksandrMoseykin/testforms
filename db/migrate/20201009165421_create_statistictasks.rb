class CreateStatistictasks < ActiveRecord::Migration[6.0]
  def change
    create_table :statistictasks do |t|
      t.text :test
      t.text :survey
      t.integer :idreg

      t.timestamps
    end
  end
end
