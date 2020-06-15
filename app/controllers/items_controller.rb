class ItemsController < ApplicationController
  
  before_action :move_to_index, except: :index
  
  def index
    @items = Item.all.order("created_at DESC").page(params[:page]).per(9)
  end
  
  def new
    @item = Item.new
  end
  
  def create
    # Item.create(item_name: item_params[:item_name], price: item_params[:price],store: item_params[:store], image: item_params[:image], text: item_params[:text], user_id:current_user.id)
    Item.create(image: item_params[:image],item_name: item_params[:item_name], price: item_params[:price],store: item_params[:store], text: item_params[:text],user_id:current_user.id)
    redirect_to :root
  end
  
  
  private
  def item_params
    # params.permit(:item_name, :price, :store, :text)
    params.require(:item).permit(:content, :item_name, :price, :store, :text,:image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end