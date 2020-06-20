class CommentsController < ApplicationController
  def create
  @comment = Comment.create(text: params[:text], item_id: params[:item_id], user_id: current_user.id)
  redirect_to "/items/#{@comment.item.id}"
  end
  
  private
  def comment_params
    params.permit(:text, :item_id)
  end
  
end
