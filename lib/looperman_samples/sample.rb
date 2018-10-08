# require_relative './concerns/findable.rb'

module LoopermanSamples
  class Sample

    # extend Concerns::Findable

    # responsible for knowing about all of the samples

    attr_accessor :title, :key, :download_count, :url, :creator, :bpm, :genre
    @@all = []

    def self.all
      @@all
    end

    def initialize(title = nil, creator = nil, genre = nil)
      @title = title
      self.creator = creator if creator
      self.genre = genre if genre
    end

    # def self.create(name)
    #   sample = self.new(name)
    #   sample.save
    #   sample
    # end


    def creator=(creator)
      @creator = creator
      creator.add_sample(self)
    end

    def genre=(genre)
      @genre = genre
      creator.add_genre(self)
    end

    def self.list_samples_by_key

    end

    def self.list_samples_by_key
      samples_sorted_by_key = LoopermanSamples::Sample.all.sort {|a, b| a.key <=> b.key}
      # samples_sorted_by_key.each_with_index do |item, index|
      #   puts "#{index + 1}." + " #{item.creator.name} - " + "#{creator.name} -"
        # + " #{item.genre.name}"
      # end
    end

    def self.list_samples_by_tempo
      #sort the samples by tempo(bpm) and return as a numbered list
      samples_sorted_by_download_count = LoopermanSamples::Sample.all.sort {|a, b| b.bpm.to_i <=> a.bpm.to_i}
      samples_sorted_by_download_count.each_with_index do |item, index|
      puts "#{index + 1}." + " #{item.title}"
    end

    def self.list_samples_by_download_count
      #sort the samples by download count and return as a numbered list
      samples_sorted_by_download_count = LoopermanSamples::Sample.all.sort {|a, b| b.download_count.to_i <=> a.download_count.to_i}
      samples_sorted_by_download_count.each_with_index do |item, index|
      puts "#{index + 1}." + " #{item.title}"
    end
    end



    # def initialize
    #   # @name = name
    #   # @artist = artist
    #   # @genre = genre
    #   @@all << self
    # end

    # creates a new sample object for each item in the hash (which was created by the Scraper class) and assigns attributes to each sample
    # could use sample_hash.each {|key, value| self.send(("#{key}="), value)} ?

    #this method should utlize the hash scraped by running LoopermanSamples::SampleScraper.create_sample_hash
    # try find or create by?
    # this is redundant now
    # def self.create_from_sample_hash(sample_hash)
    #   sample_hash.each do |sample|
    #     the_sample = Sample.new(sample[:title])
    #     # the_sample_creator = LoopermanSamples::Creator.new(sample[:creator])
    #     # the_sample_creator.add_sample(the_sample)
    #     # find_or_create_by_name(thing_name)
    #     # the_sample.title = sample[:title]
    #     the_sample.key = sample[:key]
    #     the_sample.download_count = sample[:download_count]
    #     the_sample.url = sample[:url]
    #     the_sample.creator = sample[:creator]
    #     the_sample.bpm = sample[:bpm]
    #     @@all << the_sample
    #   end
    # end



  end
end
