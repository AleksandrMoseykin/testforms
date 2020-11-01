class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :questionid
      t.integer :userid
      t.integer :scoreanswer
      t.text :answeruser
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
