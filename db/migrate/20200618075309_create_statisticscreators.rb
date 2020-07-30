class CreateStatisticscreators < ActiveRecord::Migration[6.0]
  def change
    create_table :statisticscreators do |t|
      t.integer :test
      t.integer :survey
      t.integer :idreg

      t.timestamps
    end
  end
end
