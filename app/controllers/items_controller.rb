class ItemsController < ApplicationController
 #before_action :authenticate_user!

  def index
  end

  def create
  end

  def new
    @item = Item.new
  end
end