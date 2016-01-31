class ItemsController < ApplicationController
  include ItemsHelper
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      flash[:notice] = "Item was saved. You have #{@item.lifespan.round(0)} days to complete it!"
      redirect_to [current_user]
      #will need to update this to use ajax
    else
      flash[:notice] = "There was an error saving the item.  Please try again."
      #need to implement ajax on this
      # render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
  end
  
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "#{ success_message }"
    else 
      flash[:notice] = "There was an error marking the task complete. Are you sure you finished it?"
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:body, :lifespan, :public)
  end

end
