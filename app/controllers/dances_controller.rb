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

    def show
      @dance = Dance.find(params[:id])
    end

    def edit
      @dance = Dance.find(params[:id])
    end

    def update
    end

    def destroy
      @dance = Dance.find(params[:id])
      if @dance.destroy
        redirect_to root_path
      end
    end
    

  end

  private

  def dance_params
    params.require(:dance).permit(:title, :price, :genre_id, :image, :introduce, :reservation_time).merge(user: current_user)
  end
end
