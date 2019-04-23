# require_relative './concerns/findable.rb'

module LoopermanSamples
  class Sample

    # extend Concerns::Findable
    # responsible for knowing about all of the samples

    attr_accessor :title, :key, :download_count, :url, :creator, :bpm
    @@all = []

    def self.all
      @@all
    end

    def initialize(title = nil, creator = nil, genre = nil)
      @title = title
      self.creator = creator if creator
      self.genre = genre if genre
    end

    def creator=(creator)
      @creator = creator
      creator.add_sample(self)
    end

    def self.list_samples_by_key
      all.sort {|a, b| a.key <=> b.key}.each_with_index do |item, index|
        puts "#{index + 1}." + " #{item.title} - " + "#{item.key}"
      end
    end

    def self.list_samples_by_tempo
      all.sort {|a, b| b.bpm.to_i <=> a.bpm.to_i}.each_with_index do |item, index|
        puts "#{index + 1}." + " #{item.title}" + "- #{item.bpm}"
      end
    end

    def self.list_samples_by_download_count
      all.sort {|a, b| b.download_count.to_i <=> a.download_count.to_i}.each_with_index do |item, index|
        puts "#{index + 1}." + " #{item.title}" + " - #{item.download_count} downloads"
      end
    end


  end
end
