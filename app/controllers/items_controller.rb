class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
      if @items.empty?
        @items = [OpenStruct.new(name: "ダミー商品", price: 0, shipping_fee: "無料", image_url: "dummy_image_url", sold: false)]
      end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render 'new', status: :unprocessable_entity, locals: { item: @item }
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_explanation, :category_id, :condition_id, :contribution_id,
                                 :delivery_time_id, :image, :prefecture_id, :price).merge(user_id: current_user.id)
  end
end
