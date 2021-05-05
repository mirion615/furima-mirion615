class ItemsController < ApplicationController
  def index
  end

  def new
  end


  private
  def item_params
    params.require(:item).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
