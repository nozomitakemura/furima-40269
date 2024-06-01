class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  # before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  #削除機能実装用

  def new
    @item = Item.new
  end

  def index
    @items = Item.order(created_at: :desc)
    return unless @items.empty?

    @items = [OpenStruct.new(name: 'ダミー商品', price: 0, shipping_fee: '無料', image_url: 'dummy_image_url', sold: false)]
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render 'new', status: :unprocessable_entity, locals: { item: @item }
    end
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  # end
  #削除機能実装用

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    return if @item.user == current_user

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:product_name, :product_explanation, :category_id, :condition_id, :contribution_id,
                                 :delivery_time_id, :image, :prefecture_id, :price).merge(user_id: current_user.id)
  end
end
