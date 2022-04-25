class BackgroundFacade

  def self.get_image(query)
    response = ImageService.get_image(query)
    object = ImageObject.new(response)
    ImageSerializer.format_data(object)
  end
end
