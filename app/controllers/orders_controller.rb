class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item
  before_action :redirect_if_not_owner, only: [:index,:create]
  before_action :redirect_if_sold_out, only: [:index,:create]

 
  def index
    # @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    
  end

  #   def new
  #     # @item = Item.find(params[:item_id])
  #   @order_address = OrderAddress.new
  # end

  def create
    # @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save(order_params, current_user.id)
      # @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
end

private

def set_item
  @item = Item.find(params[:item_id])
end

def order_params
  params.require(:order_address).permit(:postcode, :prefecture_id, :municipalities, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, price: @item.price, token: params[:token])
end

def redirect_if_sold_out
  if @item.purchased? 
    redirect_to root_path
  end
end

def redirect_if_not_owner
  if current_user == @item.user
    redirect_to root_path
  end
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: order_params[:price],  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end