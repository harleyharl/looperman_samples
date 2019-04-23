module Concerns
  module Findable
    # unused:
    # def find_by_name(thing_name)
    #   # detect stops on the first thing it finds that matches the condition and returns that value
    #   self.all.detect do |thing|
    #     thing.name == thing_name
    #   end
    # end

    #unused
    # def find_or_create_by_name(thing_name)
    #   if self.find_by_name(thing_name) == nil #if the song isn't in there
    #       self.create(thing_name)              #make a new song
    #   else self.find_by_name(thing_name) != nil #if the song is in there
    #     self.find_by_name(thing_name)            # find it and return it
    #   end
    # end

    def find_all_by_creator(sample)
      # sets $samples_by_creator to equal a collection of samples by given creator
      LoopermanSamples::SampleScraper.scrape_more_samples_by_creator(sample.creator)
      # displays a numbered list of those samples
      LoopermanSamples::Creator.list_all_samples_by_creator #what is this
      # sets the sample list to be used in play mode
      $sample_list = $samples_by_creator

    end

    # def samples_by_key
    #   LoopermanSamples::Sample.list_samples_by_key
    # end
    #
    # def samples_by_tempo
    #   LoopermanSamples::Sample.list_samples_by_tempo
    # end
    #
    # def samples_by_download_count
    #   LoopermanSamples::Sample.list_samples_by_download_count
    # end

  end

end
