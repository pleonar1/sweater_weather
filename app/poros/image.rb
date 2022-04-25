class Image
  attr_reader :url, :description, :source_name, :source_url
  def initialize(data)
    image = data[:results][0]
    credit = image[:user]
    @url = image[:urls][:full]
    @description = image[:alt_description]
    @source_name = credit[:name]
    @source_url = credit[:links][:html]
    #unsplash url?
  end
end
