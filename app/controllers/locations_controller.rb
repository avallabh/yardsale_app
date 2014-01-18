class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = "Location Added"
      redirect_to @location
    else
      flash[:alert] = "Location Not Added"
      render 'new'
    end
  end

  private

  def location_params
    params.require(:location).permit(:city, :state, :zip_code)
  end

end
