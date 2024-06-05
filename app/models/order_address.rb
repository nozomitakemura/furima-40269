class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipalities, :block, :building_name, :phone_number,:price, :token
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, presence: true
    validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
    validates :municipalities, presence: true
    validates :block, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :token, presence: true
    validates :price, presence: true
  end

  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end