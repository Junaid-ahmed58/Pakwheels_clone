class CarMailer < ApplicationMailer

  def new_car(car)
    @car = car
    @user = @car.user

    mail to: @user.email, subject: "New Car from #{@user.first_name}"   
  end
end
