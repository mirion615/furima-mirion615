class AddBuildingNameToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :building_name, :string
  end
end
