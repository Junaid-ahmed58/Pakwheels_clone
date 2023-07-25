class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :toggle_status, :destroy]

  def index
    @users = User.all
  end

  def show
    @cars = @user.cars.all
  end

  def toggle_status
    @user.status = @user.active? ? 'inactive' : 'active'
    if @user.save
      redirect_to admin_users_path(@user), notice: 'User status has been updated.'
    else
      redirect_to admin_users_path(@user), alert: 'Failed to update user status.'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path(@users), notice: "User was deleted sucessfully" }
    end
  end

  private

  def set_admin_user
    @user = User.find(params[:id])
  end
end
