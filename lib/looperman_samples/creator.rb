
# require_relative '../lib/concerns/findable.rb'

module LoopermanSamples

  class Creator

  attr_accessor :name, :samples
  # add profile_url

  # creator class - a creator has a name and can have many samples

  # extend Concerns::Findable

  @@creators = []

  def self.all
    @@creators
  end

  def initialize(name = nil)
    @name = name
    @samples = []
  end

  # def samples
  #   Sample.all.select do |sample|
  #     sample.creator = self
  #   end
  # end

#adds the sample into the creator's repertoire
  def add_sample(sample)
    sample.creator = self unless sample.creator
    samples << sample unless samples.include?(sample)
  end

  # def profile_url
  #
  # end
  end


end
