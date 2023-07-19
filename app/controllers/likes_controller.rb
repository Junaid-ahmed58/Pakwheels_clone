class LikesController < ApplicationController
  before_action :find_car, only: [:create, :destroy]

  def create
    if @like = Like.already_liked
      flash[:notice] = "You cannot like more then once"
    else
      @like = current_user.likes.build(car: @car)
      if @like.save
        respond_to do |format|
          format.html{redirect_to car_path(@car)}
          format.js
        end
      end
    end
  end

  def destroy
    if @like = Like.already_liked
      flash[:notice] = "Cannot unlike"
    else
      @like = current_user.likes.find(params[:id])
      @like.destroy
    end
    respond_to do |format|
    format.html{redirect_to car_path(@car)}
    format.js
    end
  end

  private

  def find_car
    @car = Car.find(params[:car_id])
  end
end
