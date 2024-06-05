class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipalities, :block, :building_name, :phone_number, :price,
                :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :token
    validates :price
  end

  def save(params, user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id:)
    Address.create(postcode:, prefecture_id:, municipalities:, block:,
                   building_name:, phone_number:, order_id: order.id)
  end
end
