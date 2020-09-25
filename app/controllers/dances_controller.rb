class DancesController < ApplicationController
  
  def index
    @dances = Dance.all
  end

  def new
    @dance = Dance.new
  end

  def create
    @dance = Dance.create(dance_params)
    if @dance.save
      redirect_to dances_path
    else
      render 'new'
    end
  end

  private

  def dance_params
    params.require(:dance).permit(:title, :price, :genre_id, :image, :introduce, :reservation_time).merge(user: current_user)
  end

end
