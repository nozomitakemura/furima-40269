class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :sell]

  def new
    @item = Item.new
  end
  
  def index
    # @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
  
end
