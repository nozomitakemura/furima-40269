class Item < ApplicationRecord
belongs_to :user
has_one_attached :image
#has_one :order(orderモデル追加後記述)

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :contribution
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

validates :image, presence: true
validates :product_name, presence: true
validates :product_explanation, presence: true
validates :category_id, presence: true, numericality: { other_than: 1 }
validates :condition_id, presence: true, numericality: { other_than: 1 }
validates :contribution_id, presence: true, numericality: { other_than: 1 }
validates :prefecture_id, presence: true, numericality: { other_than: 1 }
validates :delivery_time_id, presence: true, numericality: { other_than: 1 }
validates :price, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


#validates :name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_days_id, :price, presence: true
#validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end