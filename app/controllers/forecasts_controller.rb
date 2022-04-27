class ForecastsController < ApplicationController

  def show
    if params[:location].present?
      forecast = ForecastService.get_weather(params[:location])
      render json: ForecastSerializer.weather(forecast)
    else
      render json: {data: { message: 'location must be provided'}}, status: 404
    end
  end
end
