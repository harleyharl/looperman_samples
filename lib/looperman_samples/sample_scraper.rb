class LoopermanSamples::Sample_scraper

  #scrapes our samples

  def create_sample_hash

    sample_hash = {}

    doc = Nokogiri::HTML(open("https://www.looperman.com/loops?page=1&order=downloads&dir=d&when=1"))
    doc.css("div#body-content").css("div div.player-wrapper").each do |player_wrapper|
      title = player_wrapper.css(".player-title").text
      creator = player_wrapper.css(".player-sub-title").css(".icon-user").text
      download_count = player_wrapper.css("div .player-stats-wrapper").css(".stats-downloads").text
      url = player_wrapper.css("div .player-stats-wrapper").css("a").attr("href").text

      sample_hash = {title: title, creator: creator, download_count: download_count, url: url}
      # samples << attributes_hash
      # binding.pry

    end

  end


end
