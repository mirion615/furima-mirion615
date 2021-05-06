class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :item_price, :category_id, :item_condition_id, :delivery_charge_id,
                                 :ship_from_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
