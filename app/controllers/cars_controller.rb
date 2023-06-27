class CarsController < ApplicationController
  def index
    @cars = Car.all 
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new (car_params)
    @car.image.attach(params[:car][:image])

    respond_to do |format|
      if @car.save
        format.html { redirect_to cars_path, notice: "Car was sucessfully created"  }
      else
        format.html { render :new }
      end
    end
  end  

  def update
    @car = Car.find(params[:id])
    @car.image.attach(params[:car][:image])
     respond_to do |format|
      if @car.update(car_params)
        format.html {redirect_to cars_path, notice: "Car was sucessfully updated" }
      else
        format.html (render :edit )
      end
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_path, notice: "Car was deleted sucessfully" }
    end
  end

  private

  def car_params
    params.require(:car).permit(:vendor, :car_name, :model, :engine_capacity, :millage, :category, :color, :price, :description, :image)
  end
end
