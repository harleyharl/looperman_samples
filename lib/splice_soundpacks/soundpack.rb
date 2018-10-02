class SpliceSoundpacks::Soundpack
  
  attr_accessor :name, :artist, :price, :url 
  
  def self.today 
    #should scrape splice and return soundpacks based on that data
    self.scrape_soundpacks
  end 
  
  def self.scrape_soundpacks
    soundpacks = []
    
    soundpacks << self.scrape_splice
    
    soundpacks
  end 
  
  def self.scrape_splice
    # doc = Nokogiri::HTML(open("https://splice.com/sounds"))
    # splice_url = "https://splice.com/sounds"
    # html = open(splice_url)
    # doc = Nokogiri::HTML(html)
    # binding.pry
    doc = Nokogiri::HTML("https://splice.com/sounds")
    # content = doc.read
    binding.pry
  end 
  
end 