class AddPassToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :pasanswer, :string
  end
end
