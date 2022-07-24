class PurchasesController < ApplicationController
  def index
    @purchase = Order.new
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.find(params[:id])
    @purchase = Order.new(purchase_params) 
    if @purchase.valid?
        @purchase.save
        redirect_to root_path
    else
        render 'index'
    end
  end

  private
    def purchase_params
      params.permit(:card_number, :card_exp_month, :card_exp_month, :cvc, :post_cord, :area_id, :city, :block_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]) 
    end
end


