class SpliceSoundpacks::Soundpack
  
  attr_accessor :name, :artist, :price, :url 
  
  def self.today 
    #should scrape splice and return soundpacks based on that data
    self.scrape_deals 
  end 
  
  def self.scrape_soundpacks
    
    soundpack_1 = self.new 
    soundpack_1.name = "808s and kicks"
    soundpack_1.artist = "lex luger" 
    soundpack_1.url = "www.splice.com"
    soundpack_1.price  = "$10"
    
    soundpack_2 = self.new 
    soundpack_2.name = "dance anthems 2018"
    soundpack_2.artist = "KASHMR" 
    soundpack_2.url = "www.splice.com"
    soundpack_2.price  = "$20"
    
    [soundpack_1, soundpack_2]
  end 
  
end 