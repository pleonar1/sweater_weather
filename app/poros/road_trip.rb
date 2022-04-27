class RoadTrip
  attr_reader :travel_time, :start_point, :end_point, :weather_temp, :weather_conditions

  def initialize(travel_time_data, weather_data, start, end_point)
    @travel_time = travel_time_data[:route][:formattedTime]
    @travel_time_in_seconds = travel_time_data[:route][:realTime]
    travel_time_in_hours = travel_time_to_integer
    @start_point = start
    @end_point = end_point
    weather_at_eta = weather_data[:hourly][travel_time_in_hours - 1]
    @weather_temp = weather_at_eta[:temp]
    @weather_conditions = weather_at_eta[:weather][0][:description]
  end

  def travel_time_to_integer
    if @travel_time_in_seconds == nil
      1
    else
      result = ((@travel_time_in_seconds / 60.0) / 60.0).round(0)
    end
  end
end
