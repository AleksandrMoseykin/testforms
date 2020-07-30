class AddPasconsentToConsents < ActiveRecord::Migration[6.0]
  def change
    add_column :consents, :pasconsent, :string
  end
end
