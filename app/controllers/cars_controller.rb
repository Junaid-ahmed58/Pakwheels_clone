class CarsController < ApplicationController
  before_action :set_cars, only: [:edit , :show , :update ,  :destroy , :image , :image_update , :description , :description_update]

  def index
    @cars = Car.paginate(page: params[:page], per_page: 4).order(created_at: :desc)
  end

  def my_cars
    @user_cars = current_user.cars
    if @user_cars.blank?
      flash.now[:alert] = "You have not added any cars yet."
    end
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    respond_to do |format|
      if @car.save
        session[:car_id] = @car.id
        format.html { redirect_to car_image_path(@car) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html {redirect_to car_image_path }
      else
        format.html (render :edit )
      end
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_path, notice: "Car was deleted sucessfully" }
    end
  end

  def image; end

  def image_update
    respond_to do |format|
      if @car.update (car_params)
        format.html {redirect_to car_description_path}
      else
        format.html (render :image)
      end
    end
  end

  def description; end

  def description_update
    respond_to do |format|
      if @car.update (car_params)
        format.html {redirect_to cars_path}
      else
        format.html (render :description)
      end
    end
  end

  private

  def set_cars
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:vendor, :car_name, :model, :engine_capacity, :millage, :category, :color, :price, :description, :user_id, images:[])
  end
end
