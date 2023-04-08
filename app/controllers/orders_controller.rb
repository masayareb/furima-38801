class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
