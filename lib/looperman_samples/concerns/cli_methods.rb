module CliMethods

  module Findable
    def find_all_by_creator(sample) #returns an array of sample objects
      if !sample.creator.scraped
        LoopermanSamples::SampleScraper.scrape_more_samples_by_creator(sample.creator)
      end
      sample.creator.samples
    end
  end

  module Scrapeable
    def scrape
      LoopermanSamples::SampleScraper.scrape_samples
    end
  end

  module Listable
    def list_by_key
      LoopermanSamples::Sample.list_samples_by_key
    end

    def list_by_tempo
      LoopermanSamples::Sample.list_samples_by_tempo
    end

    def list_by_downloads
      LoopermanSamples::Sample.list_samples_by_download_count
    end

    def list_all_samples_by_creator(sample_objects) #puts samples in numbered list
      # creator = sample_objects.first.creator
      sample_objects.each_with_index do |sample, index|
        puts "#{index + 1}." + " #{sample.title}"
      end
    end
  end

end
