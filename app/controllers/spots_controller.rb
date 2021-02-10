class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_spot, only: [:show, :edit, :destroy]
  
  def index
    @spots = Spot.order("created_at DESC")
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @spot.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    spot = Spot.find(params[:id])
    if spot.update(spot_params)
      redirect_to spot_path
    else
      render :edit
    end
  end

  def destroy
    if @spot.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :genre_id, :place_id, :explanation, :plan, :wifi_id, :budget, :image).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end