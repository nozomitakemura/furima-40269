class Item < ApplicationRecord
belongs_to :user
has_one_attached :image
#has_one :order(orderモデル追加後記述)


#validates :name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_days_id, :price, presence: true
#validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
