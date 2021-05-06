class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :ship_from
  belongs_to :days_to_ship
  belongs_to :user, optional: true
  has_one_attached :image




  with_options presence:true do
    validates :image
    validates :title,  length: { maximum: 40 }
    validates :text, length: { maximum: 1_000 }
    validates :item_price 

    with_options numericality: { other_than: 1 }  do
      validates :category_id 
      validates :item_condition_id
      validates :delivery_charge_id
      validates :ship_from_id
      validates :days_to_ship_id
    end

    validates :item_price, numericality: {greater_than: 300,less_than: 9_999_999}, format: { with: /\A[0-9]+\z/}, allow_blank: true
  end
end
