class AddTopicidToLinktasks < ActiveRecord::Migration[6.0]
  def change
    add_column :linktasks, :topicid, :string
    add_column :linktasks, :integer, :string
  end
end
