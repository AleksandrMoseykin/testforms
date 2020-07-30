class AddScoreToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :scoreanswer, :integer
  end
end
