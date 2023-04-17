class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_address, only: [:index, :create]
  def index
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    if @order_address.valid?
      item_pay
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order_address
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
      )
  end
end
