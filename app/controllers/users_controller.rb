class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @items = policy_scope(@user.items)
        @item = Item.new
    end
end