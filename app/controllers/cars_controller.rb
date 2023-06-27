class CarsController < ApplicationController
  before_action :set_cars, only: [:edit , :show , :update , :destroy]

  def index
    @cars = Car.all 
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = Car.new (car_params)
    respond_to do |format|
      if @car.save
        format.html { redirect_to cars_path, notice: "Car was sucessfully created"  }
      else
        format.html { render :new }
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
