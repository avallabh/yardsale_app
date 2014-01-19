class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @location = Location.find(params[:location_id])
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @location = Location.find(params[:location_id])
    @item = @location.items.build(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = "Item Added"
      redirect_to @location
    else
      flash[:alert] = "Item Not Added"
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :latitude, :longitude, user_id: current_user)
  end

end
