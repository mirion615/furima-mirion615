class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :new

  def index
  end

  def create 
    
  end
end
