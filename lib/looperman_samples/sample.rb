class LoopermanSamples::Sample

  attr_accessor :title, :key, :download_count, :url, :creator, :bpm
  #key, tempo, number of downloads

  def self.today
    #should scrape splice and return soundpacks based on that data
    self.scrape_samples
  end

  def self.scrape_samples
    samples = []

    samples << self.scrape_looperman

    samples
  end

  def self.scrape_looperman

    doc = Nokogiri::HTML(open("https://www.looperman.com/loops?page=1&order=downloads&dir=d&when=1"))
    doc.css("div#body-content").css("div div.player-wrapper").each do |player_wrapper|
      title = player_wrapper.css(".player-title").text
      creator = player_wrapper.css(".player-sub-title").css(".icon-user").text
      download_count = player_wrapper.css("div .player-stats-wrapper").css(".stats-downloads").text
      url = player_wrapper.css("div .player-stats-wrapper").css("a").attr("href").text

      attributes_hash = {title: title, creator: creator, download_count: download_count, url: url}
      binding.pry
    end
      # sample_title = player_wrapper.css("div.player-top").text
    # doc.css(".body-content").css("div div.player-wrapper")
    # .each do |sample_player|
    #     sample_title = sample_player.css("div.player-top").text
        # binding.pry
      # end
      # samples << {title: title, key: key, download_count: download_count, url: url, creator: creator, bpm: bpm}


    # sample_title = doc.css(".player-top").css("a.player-title").each do |title|
    #   title.text
    #   binding.pry
    # end
      # sample_titles << item.text
  end

  #sample title - each player-wrapper has a player topper which has the title of the track in its player-title
  #content = doc.css(".player-top").css("a.player-title")
  #user - each player-wrapper class has a player-midtop class that has a player-sub-title class that has an <a> tag with txt inside that is a link to the creator of the sample (i.e a user)
  #description - inside div #body-left there is a div tag with a class of .desc-wrapper which includes the text that is the description
  #tags - inside div #body-left there is a div tag with class of .tag-wrapper, inside of which there are several a-tags, whose text properties are tags such as bpm, key, genre

end
