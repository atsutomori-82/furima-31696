class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to action: :index
    else
      render 'index'
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:post_number, :region_id, :city, :address, :building, :tel).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
   @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: item_order_params[:token],
      currency: 'jpy'
    )
  end

end
