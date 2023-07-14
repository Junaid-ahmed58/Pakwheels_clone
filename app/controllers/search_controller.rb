class SearchController < ApplicationController
  def search
    @results = Car.search(params)
    render turbo_stream:
      turbo_stream.update('cars',
                          partial: 'cars/cars',
                          locals: { cars: @results })
  end
end
