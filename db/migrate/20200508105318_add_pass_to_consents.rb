class AddPassToConsents < ActiveRecord::Migration[6.0]
  def change
    add_column :consents, :pasattempt, :integer
  end
end
