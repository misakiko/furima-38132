class PurchasesController < ApplicationController
  def index
    @purchases = Address.create
  end

  def create
   Purchase.create(purchase_params) 
   redirect_to root_path
  end

  private
  def purchase_params
    params.permit(:card_number, :card_exp_month, :card_exp_month, :cvc, :post_cord, :area_id, :city, :block_number, :building, :phone_number) 
  end

end

