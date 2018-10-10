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

    def creator=(creator)
      @creator = creator
      creator.add_sample(self)
    end

    def genre=(genre)
      @genre = genre
      creator.add_genre(self)
    end

    def self.list_samples_by_key
      #sort the samples by key and return as a numbered list
      samples_sorted_by_key = LoopermanSamples::Sample.all.sort {|a, b| a.key <=> b.key}
      samples_sorted_by_key.each_with_index do |item, index|
        puts "#{index + 1}." + " #{item.title} - " + "#{item.key}"
      end
    end

    def self.list_samples_by_tempo
      #sort the samples by tempo(bpm) and return as a numbered list
      samples_sorted_by_tempo = LoopermanSamples::Sample.all.sort {|a, b| b.bpm.to_i <=> a.bpm.to_i}
      samples_sorted_by_tempo.each_with_index do |item, index|
      puts "#{index + 1}." + " #{item.title}" + "- #{item.bpm}"
    end
    end

    def self.list_samples_by_download_count
      #sort the samples by download count and return as a numbered list
      samples_sorted_by_download_count = LoopermanSamples::Sample.all.sort {|a, b| b.download_count.to_i <=> a.download_count.to_i}
      samples_sorted_by_download_count.each_with_index do |item, index|
      puts "#{index + 1}." + " #{item.title}" + " - #{item.download_count} downloads"
    end
    end


  end
end
