class CreateStatisticvisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :statisticvisitors do |t|
      t.integer :idregvis
      t.integer :idreg

      t.timestamps
    end
  end
end
