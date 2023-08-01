class SearchController < ApplicationController
  def search
    @results = Car.search(params)
    respond_to do |format|
      format.html { render partial: 'cars/cars', locals: { cars: @results } }
    end
  end
end
