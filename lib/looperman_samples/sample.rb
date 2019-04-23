# require_relative './concerns/findable.rb'

module LoopermanSamples
  class Sample

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

    def self.sort_by_key
      all.sort{|a, b| a.key <=> b.key}
    end

    def self.list_samples_by_key
      sort_by_key.each_with_index do |item, index|
        #get rid of this! puts shouldn't be in sample class
        puts "#{index + 1}." + " #{item.title} - " + "#{item.key}"
      end
    end

    def self.sort_by_tempo
      all.sort{|a, b| b.bpm.to_i <=> a.bpm.to_i}
    end

    def self.list_samples_by_tempo
      sort_by_tempo.each_with_index do |item, index|
        #get rid of this! puts shouldn't be in sample class
        puts "#{index + 1}." + " #{item.title}" + "- #{item.bpm}"
      end
    end

    def self.sort_by_download_count
      all.sort{|a, b| b.download_count.to_i <=> a.download_count.to_i}
    end

    def self.list_samples_by_download_count
      sort_by_download_count.each_with_index do |item, index|
        #get rid of this! puts shouldn't be in sample class
        puts "#{index + 1}." + " #{item.title}" + " - #{item.download_count} downloads"
      end
    end

  end
end
