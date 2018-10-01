class SpliceSoundpacks::Soundpack
  
  attr_accessor :name, :artist, :price, :url 
  
  def self.today
    #should return a bunch of instances of deals
    #     puts <<-DOC
    # 1. lex luger - 808s and kicks - May 2016
    # 2. KASHMR - dance anthems 2018 - March 2018
    # 3. Aphex Twin - Psychadelic Drums - December 1999
    # DOC
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