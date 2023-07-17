class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    if @like.save
      flash[:notice]= ["Thanks for like this car"]
    end

    redirect_to @like.car
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    car = @like.car
    @like.destroy
    redirect_to car_path
  end

  private

  def like_params
    params.require(:like).permit(:car_id)
  end
end
