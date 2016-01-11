class ItemsController < ApplicationController
  # def index
    
  # end

  # def show
  #   @item = Item.find(params[:item_id])
  # end
  #The two above may not be necessary, unless i create a partial to display items on a user's page

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      flash[:notice] = "Item was saved."
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
      flash[:notice] = "Task was marked as complete.  Give yourself a high five!"
      redirect_to [current_user]
    else 
      flash[:notice] = "There was an error marking the task complete. Are you sure you finished it?"
      redirect_to [current_user]
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:body)
  end
end
