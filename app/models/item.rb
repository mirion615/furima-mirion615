class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :item_condition, :delivery_charge, :ship_from, :days_to_ship
  belongs_to :user
  has_one_attached :image




  with_options presence:true, numericality: { other_than: 1 } do
    validates :category_id, :item_condition, :delivery_charge, :ship_from, :days_to_ship
  end



  end
