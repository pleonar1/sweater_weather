class ImageFacade

  def self.get_image(query)
    response = ImageService.get_image(query)
    object = Image.new(response)
    ImageSerializer.format_data(object)
  end
end
