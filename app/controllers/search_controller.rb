class SearchController < ApplicationController
  def index
    binding.pry
    @stations = Station.all(params[:q])
  end
end
