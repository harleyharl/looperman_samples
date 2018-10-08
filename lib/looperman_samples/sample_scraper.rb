require_relative '../lib/concerns/findable.rb'

module LoopermanSamples
    class SampleScraper
        extend Concerns::Findable

        #scrapes our samples into a big hash of string attributes
        @@sample_hashes_scraped = []

        def self.create_sample_hash
          doc = Nokogiri::HTML(open("https://www.looperman.com/loops?page=1&order=downloads&dir=d&when=1"))
          doc.css("div#body-content").css("div div.player-wrapper").each do |player_wrapper|

            title = player_wrapper.css(".player-title").text

            # creator = LoopermanSamples::Creator.new(player_wrapper.css(".player-sub-title").css(".icon-user").text)
            # # this doesn't work... try "find or create by"
            #
            # creator = player_wrapper.css(".player-sub-title").css(".icon-user").text
            # creator.add_sample(self)


            download_count = player_wrapper.css("div .player-stats-wrapper").css(".stats-downloads").text
            url = player_wrapper.css("div .player-stats-wrapper").css("a").attr("href").text
            #add a few more attributes

            sample_hash = {title: title, creator: creator, download_count: download_count, url: url}
            @@sample_hashes_scraped << sample_hash
          end
          # i don't like this...
          @@sample_hashes_scraped
        end

    end
end
