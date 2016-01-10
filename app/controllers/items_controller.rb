class ItemsController < ApplicationController
  def index
    
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def edit
  end
end
