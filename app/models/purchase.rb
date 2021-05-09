class Purchase < ApplicationRecord
  has_one :Address
  belongs_to :user
  belongs_to :item
end
