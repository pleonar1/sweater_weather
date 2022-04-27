class MunchiesController < ApplicationController

  def show
    yelp = YelpFacade.get_yelp(params[:food], params[:destination])
    travel_time_hash = LocationService.get_travel_time(params[:start], params[:destination])
    travel_time = travel_time_hash[:route][:formattedTime]
    weather = ForecastService.get_weather(params[:destination])[:current]
    render json: MunchieSerializer.food_data(params[:destination], travel_time, weather, yelp )
  end
end
