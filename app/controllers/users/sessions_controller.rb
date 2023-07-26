# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: params[:user][:email])
    if user.present? && user.inactive?
      flash[:alert] = "Your account is inactive. Please contact to admin."
      redirect_to new_user_session_path
    else
      super 
    end
  end
end
