class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :titlequestion
      t.text :imgquestion
      t.text :answertrue
      t.text :answer2
      t.text :answer3
      t.text :answer4

      t.references :topic, null: false, foreign_key: true
      t.timestamps
    end
  end
end
