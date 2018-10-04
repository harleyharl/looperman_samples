class LoopermanSamples::Sample

  attr_accessor :title, :key, :download_count, :url, :creator, :bpm
  #imports the sample_hash and generates a sample object using mass assignment

  #sample class is responsible for knowing about all of the samples
  @@all = []

  def self.all
    @@all
  end


  def initialize(sample_hash)
    sample_hash.each do |sample|
    @@all << self
    sample.title = title
    sample.key = key
    sample.download_count = download_count
    sample.url = url
    sample.creator = creator
    sample.bpm = bpm
  end

end
