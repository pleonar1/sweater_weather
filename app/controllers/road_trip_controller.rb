class RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:road_trip][:api_key])
    roadtrip = RoadTripFacade.get_travel_info(params[:road_trip][:origin], params[:road_trip][:destination])
    road_service = LocationService.get_travel_time(params[:road_trip][:origin], params[:road_trip][:destination])
    if user != nil
      unless (road_service[:info][:statuscode] == 402)
        render json: RoadTripSerializer.format_data(roadtrip), status: 201
      else
        render json: RoadTripSerializer.no_route(params[:road_trip][:origin], params[:road_trip][:destination]), status: 400
      end
    elsif user == nil
      render json: {message: "API key INVALID"}, status: 400
    end
  end
end
