class Admin::UsersController < AdminController
  def index
    @users = User.all
  end
  def show
  end


  def toggle_status
    @user = User.find(params[:id])
    @user.status = @user.active? ? 'inactive' : 'active'
    if @user.save
      redirect_to admin_users_path(@user), notice: 'User status has been updated.'
    else
      redirect_to admin_users_path(@user), alert: 'Failed to update user status.'
    end
  end
end
