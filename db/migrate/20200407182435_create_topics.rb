class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :titletopic
      t.integer :countquestions
      t.integer :sucquest
      t.time :timetask
      t.text :password
      t.text :ip
      t.text :email
      t.text :type
      t.text :activ

      t.timestamps
    end
  end
end
