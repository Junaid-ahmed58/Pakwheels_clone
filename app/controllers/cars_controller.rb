class CarsController < ApplicationController
  before_action :set_cars, only: [:edit , :show , :update , :destroy , :step2 , :step3]

  def index
    @cars = Car.all 
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
        session[:car_id] = @car.id
        format.html { redirect_to car_step2_path(@car) }
      else
        format.html { render :new }
      end
    end
  end  

  def step2
    @car = Car.find(params[:id])
  end

  def step2_update
    @car = Car.find(params[:id])
    respond_to do |format|
      if @car.update (car_params)
        format.html {redirect_to car_step3_path}
      else
        format.html (render :step2)
      end
    end
  end

  def step3
    @car = Car.find(params[:id])
  end

  def step3_update
    @car = Car.find(params[:id])
    respond_to do |format|
      if @car.update (car_params)
        format.html {redirect_to cars_path}
      else
        format.html (render :step3)
      end
    end
  end

  def update
     respond_to do |format|
      if @car.update(car_params)
        format.html {redirect_to cars_path, notice: "Car was sucessfully updated" }
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

  private

  def set_cars
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:vendor, :car_name, :model, :engine_capacity, :millage, :category, :color, :price, :description, images: [])
  end
end
