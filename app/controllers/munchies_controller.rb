class MunchiesController < ApplicationController

  def show
    @starting_location = LocationService.get_location(params[:start])
    @ending_location = LocationService.get_location(params[:destination])
    @yelp = YelpFacade.get_yelp(params[:food])
  
  end

end
