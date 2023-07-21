class Admin::UsersController < AdminController
  def index
    @users = User.all
  end
  def show
  end


  def toggle_status
    if @user.active?
      @user.deactive!
    elsif @user.deactive?
      @user.active!
    end
    redirect_to admin_user_path, notice: 'Post status has been updated.' 
  end

end
