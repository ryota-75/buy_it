class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @items = user.items.page(params[:page]).per(6).order("created_at DESC")
  end
  
end
