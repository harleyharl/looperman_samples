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
    samples = []
    doc = Nokogiri::HTML(open("https://www.looperman.com/loops?page=1&order=downloads&dir=d&when=1"))
    content = doc.css(".player-top").css("a.player-title")
    content.each do |item|
      sample_titles << item.text
    end
  end

  #sample title - each player-wrapper has a player topper which has the title of the track in its player-title
  #content = doc.css(".player-top").css("a.player-title")
  #user - each player-wrapper class has a player-midtop class that has a player-sub-title class that has an <a> tag with txt inside that is a link to the creator of the sample (i.e a user)
  #description - inside div #body-left there is a div tag with a class of .desc-wrapper which includes the text that is the description
  #tags - inside div #body-left there is a div tag with class of .tag-wrapper, inside of which there are several a-tags, whose text properties are tags such as bpm, key, genre

end
