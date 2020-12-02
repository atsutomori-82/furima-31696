class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  

  def index
    @item_order = ItemOrder.new
  end

  def def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      @item_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:post_number, :region_id, :city, :address, :building, :tel).merge(token: params[:token])
  end

  def set_item
   @item = Item.find(params[:item_id])
  end

end
