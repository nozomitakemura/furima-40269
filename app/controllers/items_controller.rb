class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      # logger.debug @item.errors.inspect
      render 'new', status: :unprocessable_entity, locals: { item: @item }
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_explanation, :category_id, :condition_id, :contribution_id,
                                 :delivery_time_id, :image, :prefecture_id, :price).merge(user_id: current_user.id)
  end
end
