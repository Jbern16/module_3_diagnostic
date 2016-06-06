class SearchController < ApplicationController
  def index
    distance = params[:d][:number]
    @stations = Station.all(params[:q], distance)
  end
end
