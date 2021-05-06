class RenameItemPriceIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :item_price_id, :item_price
  end
end
