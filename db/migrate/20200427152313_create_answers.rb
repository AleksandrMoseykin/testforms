class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :answeruser
      t.integer :questionid
      t.integer :userid

      t.timestamps
    end
  end
end
