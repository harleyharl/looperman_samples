
module LoopermanSamples
    class SampleScraper

        # uses nokogiri's output to instantiate sample and creator objects and assign them attributes, then establishes the sample-creator relationship
        # there will be 25 samples from the front page of looperman

        def self.scrape_samples

          doc = Nokogiri::HTML(open("https://www.looperman.com/loops?page=1&order=downloads&dir=d&when=1"))
          doc.css("div#body-content").css("div div.player-wrapper").each do |sample_bundle|
            #instantiates new sample and provides it with scraped attributes
                the_sample = Sample.new
                the_sample.title = sample_bundle.css(".player-title").text
                the_sample.url = sample_bundle.css("div .player-stats-wrapper").css("a").attr("href").text
                the_sample.download_count = sample_bundle.css("div .player-stats-wrapper").css(".stats-downloads").text
            #instantiates a new sample and establishes sample-creator relationship
                sample_creator = Creator.new
                sample_creator.name = sample_bundle.css(".player-sub-title").css(".icon-user").text
                the_sample.creator = sample_creator
                the_sample.bpm = 
            #inserts the sample into the Sample.all array
                Sample.all << the_sample
              end

          Sample.all
        end

    end
end
