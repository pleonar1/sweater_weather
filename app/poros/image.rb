class Image
  attr_reader :url, :description, :source_name, :source_url, :source_photo
  
  def initialize(data)
    image = data[:results][0]
    credit = image[:user]
    @url = image[:urls][:full]
    @description = image[:alt_description]
    @source_name = credit[:name]
    @source_url = credit[:links][:html]
    @source_photo = 'https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg'
    #unsplash url?
  end
end
