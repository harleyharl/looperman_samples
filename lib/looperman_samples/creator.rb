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

  def self.list_all_samples_by_creator
    # binding.pry
    $samples_by_creator.each_with_index do |sample, index|
      puts "#{index + 1}." + " #{sample.title}"
    end
  end

  end


end
