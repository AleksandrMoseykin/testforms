class CreateYouanswers < ActiveRecord::Migration[6.0]
  def change
    create_table :youanswers do |t|
      t.text :answeruser
      t.integer :scoreanswer
      t.integer :issueid
      t.integer :userid
      t.text :usercode
      t.references :taskform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
