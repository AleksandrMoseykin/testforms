class AddColToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :delete, :string
  end
end
