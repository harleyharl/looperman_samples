
module LoopermanSamples
    class SampleScraper

        # uses nokogiri's output to instantiate sample and creator objects and assign them attributes, then establishes the sample-creator relationship
        # there will be 25 samples from the front page of looperman

        def self.scrape_samples
          doc = Nokogiri::HTML(open("https://www.looperman.com/loops?page=1&order=downloads&dir=d&when=1")) #goes to search for most downloaded in past 24 hours
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
            #dives into the sample's url to retrieve "bpm" and "key" tags
                sample_page = Nokogiri::HTML(open(the_sample.url))
                the_sample.bpm = sample_page.css("div .tag-wrapper a").text.match(/\d\d\d\s(bpm)/).to_s
                the_sample.key = sample_page.css("div .tag-wrapper a").text.match(/(Key)\s[:]\s\w/).to_s
            #makes key either "unknown" or single letter
                  if the_sample.key == "Key : U"
                    the_sample.key = "Key unknown"
                  else
                    the_sample.key = the_sample.key.sub(/(Key)\s[:]\s/, "")
                  end
            #inserts the sample into the Sample.all array
                Sample.all << the_sample
              end
          Sample.all
        end

        def self.scrape_more_samples_by_creator(sample_creator)
          # binding.pry
          $samples_by_creator = []
          doc = Nokogiri::HTML(open("https://www.looperman.com/loops?mid=#{sample_creator.name}"))
          doc.css("div#body-content").css("div div.player-wrapper").each do |sample_bundle|
            the_sample = Sample.new
            the_sample.title = sample_bundle.css(".player-title").text
            # binding.pry
            the_sample.creator = sample_creator
            #overwrites each time CLI used
            $samples_by_creator << the_sample
            $samples_by_creator
            # sample
          end
        end

    end
end
