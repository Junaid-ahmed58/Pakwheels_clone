class SearchController < ApplicationController
  def search
    @results = Car.all
    @results = @results.where("vendor like ?", params[:vendor]) if params[:vendor].present?
    @results = @results.where("car_name like ?", params[:car_name]) if params[:car_name].present?
    @results = @results.where("model like ?", params[:model]) if params[:model].present?
    @results = @results.where("category like ?", params[:category]) if params[:category].present?
    @results = @results.where("engine_capacity like ?", params[:engine_capacity]) if params[:engine_capacity].present?
    render turbo_stream:
        turbo_stream.update('cars',
                            partial: 'cars/cars',
                            locals: { cars: @results})
  end
end
