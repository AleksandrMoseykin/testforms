class CreateTaskforms < ActiveRecord::Migration[6.0]
  def change
    create_table :taskforms do |t|
      t.string :titletask
      t.integer :countquestions
      t.text :password
      t.integer :idreg
      t.text :successmessage
      t.text :failuremessage
      t.text :activ
      t.text :sucquest
      t.text :email
      t.text :rand

      t.timestamps
    end
  end
end
