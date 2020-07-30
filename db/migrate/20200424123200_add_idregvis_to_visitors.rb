class AddIdregvisToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_column :visitors, :idregvis, :integer
  end
end
