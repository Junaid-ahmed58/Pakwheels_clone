class SearchController < ApplicationController
  def search
    @results = Car.search(params[:search])
    @results = Car.search('*') if params[:search].blank?
    render turbo_stream:
        turbo_stream.update('cars',
                            partial: 'cars/cars',
                            locals: { cars: @results})
  end

end
