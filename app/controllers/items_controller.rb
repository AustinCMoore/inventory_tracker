class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create!(name: params[:item_name])
    redirect_to "/items"
  end

  def new
  end
end
