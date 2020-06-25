class ItemsController < ApplicationController
  
  before_action :move_to_index, except: [:index,:show]
  before_action :correct_user, only: [:edit,:update]

  def index
    @items = Item.includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end
  
  def new
    @item = Item.new
  end
  
  def create
    Item.create(image: item_params[:image],item_name: item_params[:item_name], price: item_params[:price],store: item_params[:store], text: item_params[:text],user_id:current_user.id)
    redirect_to :root
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
    redirect_to :root
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params) if item.user_id == current_user.id
    redirect_to :root
  end
  
  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.includes(:user)
  end
  
  private
  def item_params
    params.require(:item).permit(:content, :item_name, :price, :store, :text,:image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def correct_user
    @item = Item.find(params[:id])
    if current_user != @item.user
       redirect_to root_path
    end
  end
  
end