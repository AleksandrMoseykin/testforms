class AddPartNumberToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :successmessage, :text
  end
end
