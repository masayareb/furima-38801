class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: [:new,:create]

  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:item, :content, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end

end

