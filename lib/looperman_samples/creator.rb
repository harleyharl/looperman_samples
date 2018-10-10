module LoopermanSamples

  class Creator

  attr_accessor :name, :samples

  # creator class - a creator has a name and can have many samples
  @@creators = []

  def self.all
    @@creators
  end

  def initialize(name = nil)
    @name = name
    @samples = []
    @@creators << self
  end

  # def samples
  #   Sample.all.select do |sample|
  #     sample.creator = self
  #   end
  # end

#adds the sample into the creator's repertoire
  def add_sample(sample)
    sample.creator = self unless sample.creator
    self.samples << sample unless self.samples.include?(sample)
  end

  # def profile_url
  #
  # end
  end


end
