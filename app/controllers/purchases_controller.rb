class PurchasesController < ApplicationController
  def index
    @purchase = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Order.new(purchase_params) 
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
        render 'index'
    end
  end

  private
    def purchase_params
      params.require(:order).permit(:post_cord, :area_id, :city, :block_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
    end

    def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy' 
      )   
    end     
end
