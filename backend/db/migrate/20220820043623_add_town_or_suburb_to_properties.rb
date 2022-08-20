class AddTownOrSuburbToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :town_or_suburb, :string
  end
end
