class Admin::CarsController < AdminController
  before_action :set_admin_car, only: [:destroy , :show]

  def index
    @cars = Car.all
  end

  def show; end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to admin_car_path, notice: "Car was deleted sucessfully" }
    end
  end

  private

  def set_admin_car
    @car = Car.find(params[:id])
  end

end
