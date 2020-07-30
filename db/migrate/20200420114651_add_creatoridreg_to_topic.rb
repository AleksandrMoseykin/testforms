class AddCreatoridregToTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :idreg, :integer
  end
end
