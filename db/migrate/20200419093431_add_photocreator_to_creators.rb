class AddPhotocreatorToCreators < ActiveRecord::Migration[6.0]
  def change
    add_column :creators, :photocreator, :string
  end
end
