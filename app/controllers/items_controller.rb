class ItemsController < ApplicationController
 #before_action :authenticate_user!
 before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    #@items = Item.all.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :shipping_id, :region_id, :shipping_day_id, :price, :uer ).merge(user_id: current_user.id)
  end

end