class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
  end
  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end
  private
    def item_params
    params.require(:items).permit(:image, :item_name, :price, :price_bear).merge(user_id: current_user.id)
    end
end
