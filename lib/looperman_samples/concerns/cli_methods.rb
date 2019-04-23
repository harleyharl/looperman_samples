module CliMethods
  module Findable
    def find_all_by_creator(sample) #returns an array of sample objects
      # binding.pry
      # sets the sample's creator's sample array to equal a collection of samples (by scraping)
      LoopermanSamples::SampleScraper.scrape_more_samples_by_creator(sample.creator)
      # displays a numbered list of those samples
      # creators_samples = list_all_samples_by_creator(sample) #returns a list by looking up global variable... not good

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
      # LoopermanSamples::Sample.all.sort {|a, b| a.key <=> b.key}
    end

    def list_by_tempo
      LoopermanSamples::Sample.list_samples_by_tempo
      # $sample_list = LoopermanSamples::Sample.all.sort {|a, b| b.bpm.to_i <=> a.bpm.to_i}
    end

    def list_by_downloads
      LoopermanSamples::Sample.list_samples_by_download_count
      # $sample_list = LoopermanSamples::Sample.all.sort {|a, b| b.download_count.to_i <=> a.download_count.to_i}
    end

    def list_all_samples_by_creator(sample_objects) #puts samples in numbered list
      sample_objects.each_with_index do |sample, index|
        puts "#{index + 1}." + " #{sample.title}"
      end
    end

  end

end
