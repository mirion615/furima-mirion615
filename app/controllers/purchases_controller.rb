class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :new

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create 
    @purchase_address = purchase_address.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    @item = Item.find(params[:id])
    params.require(:purchase_address).permit(:postal_code, :ship_from_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
