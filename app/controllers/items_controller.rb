class ItemsController < ApplicationController
  before_action :authenticate_user! expect[:index]
  def index
    @items = Item.all
  end
  def new
    @items = Item.new
  end

  private
    def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
    end
end
