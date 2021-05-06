class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title, null: false
      t.text       :text, null: false
      t.integer   :category_id, null: false
      t.integer   :item_condition_id, null: false
      t.integer   :delivery_charge_id, null: false
      t.integer   :ship_from_id, null: false
      t.integer   :days_to_ship_id, null: false
      t.integer   :item_price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
