class DancesController < ApplicationController
  before_action :set_dance, only: [:show, :edit, :update, :destroy]

  def index
    @dances = Dance.all.order("created_at DESC")
  end

  def new
    @dance = Dance.new
  end

  def create
    @dance = Dance.new(dance_params)
    if @dance.save
      redirect_to dances_path
    else
      render 'new'
    end
  end

    def show
    end

    def edit
    end

    def update
      if @dance.update(dance_params)
        redirect_to dance_path(@dance.id)
      else
        render 'edit'
      end
    end

    def destroy
      if @dance.destroy
        redirect_to dances_path
      end
    end

    private

  def dance_params
    params.require(:dance).permit(:title, :price, :genre_id, :image, :introduce, :reservation_time).merge(user: current_user)
  end

  def set_dance
    @dance = Dance.find(params[:id])
  end
end
