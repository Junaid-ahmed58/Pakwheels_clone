class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.car_id = params[:car_id]
    if @comment.save
      redirect_to car_path(params[:car_id])
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :car_id)
  end
end
