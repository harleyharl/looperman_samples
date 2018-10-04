class LoopermanSamples::Sample

  attr_accessor :title, :key, :download_count, :url, :creator, :bpm
  #imports the sample_hash and generates a sample object using mass assignment

  #sample class is responsible for knowing about all of the samples
  @@all = []

  def self.all
    @@all
  end

  def initialize
    Sample.new
    # @@all << self
  end



#creates a new sample object for each item in the hash (the hash was created by the Scraper class) and assigns attributes to each sample
  def create_from_sample_hash(sample_hash)
    sample_hash.each do |sample|
      the_sample = Sample.new
      the_sample.title = sample[:title]
      the_sample.key = sample[:key]
      the_sample.download_count = sample[:download_count]
      the_sample.url = sample[:url]
      the_sample.creator = sample[:creator]
      the_sample.bpm = sample[:bpm]
      # same as sample_hash.each {|key, value| self.send(("#{key}="), value)}
      @@all << the_sample
      binding.pry
    end
  end

  # def initialize(student_hash)
  #   sample_hash.each {|key, value| self.send(("#{key}="), value)}
  #   @@all << self
  # end

end
