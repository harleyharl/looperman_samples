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
  
  def delf.scrape_splice
    doc = Nokogiri::HTML(open(https://splice.com/))
    binding.pry
  end 
  
end 