class ImagesController < ApplicationController

  def show
    response = ImageFacade.get_image(params[:location])
    if response[:results] == []
      render json: response, status: 404
    else
      render json: response, status: 200
    end
  end
end
