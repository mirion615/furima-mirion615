class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'Input correctly' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :ship_from_id, numericality: { other_than: 1, message: 'Select' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, building_name: building_name,
                             phone_number: phone_number, ship_from_id: ship_from_id, purchase_id: purchase.id)
  end
end
