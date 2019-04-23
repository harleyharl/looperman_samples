module LoopermanSamples
  class Creator

    attr_accessor :name, :samples, :scraped

    @@creators = []

    def self.all
      @@creators
    end

    def initialize(name = nil)
      self.scraped = false
      @name = name
      @samples = []
      @@creators << self
    end


    def add_sample(sample)
      sample.creator = self unless sample.creator
      self.samples << sample unless self.samples.include?(sample)
    end

  end
end
