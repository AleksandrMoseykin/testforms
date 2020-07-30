class AddIdregToCreators < ActiveRecord::Migration[6.0]
  def change
    add_column :creators, :idreg, :integer
  end
end
