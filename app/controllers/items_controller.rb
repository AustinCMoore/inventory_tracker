class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    if params[:item_name].empty?
      redirect_to "/items/new", notice: "Please provide an item name"
    else
      Item.create!(name: params[:item_name])
      redirect_to "/items", notice: "Your item has been created"
    end
  end

  def new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if params[:item_name].empty?
      redirect_to "/items/#{item.id}/edit", notice: "Please add a name"
    else
      item.update!(name: params[:item_name])
      redirect_to "/items", notice: "Your item has been updated"
    end
  end
end
