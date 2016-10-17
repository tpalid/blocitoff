class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        authorize @user
        @items = policy_scope(@user.items)
        @item = Item.new
        # render json: @user
    end
end