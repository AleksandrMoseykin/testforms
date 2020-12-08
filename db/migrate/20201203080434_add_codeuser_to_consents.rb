class AddCodeuserToConsents < ActiveRecord::Migration[6.0]
  def change
    add_column :consents, :code, :string
  end
end
