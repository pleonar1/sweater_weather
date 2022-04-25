class ImageSerializer

  def self.format_data(object)
    {
      "data": {
        "image": {
          "url": object.url,
          "description": object.description
        },
        "credits": {
          "source_name": object.source_name,
          "source_url": object.source_url,
          "source_photo": object.source_photo
        }
      }
    }
  end
end
