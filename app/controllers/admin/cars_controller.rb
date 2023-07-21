class Admin::CarsController < AdminController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    respond_to do |format|
      format.html { redirect_to admin_car_path, notice: "Car was deleted sucessfully" }
    end
  end
end
