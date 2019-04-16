# require "open-uri"
# require "nokogiri"
# require "pry"
require_relative "./looperman_samples/version"
require_relative "./looperman_samples/cli"
require_relative "./looperman_samples/sample"
require_relative "./looperman_samples/sample_scraper"
require_relative "./looperman_samples/creator"

class LoopermanSamples
  def self.hi
    puts "Hello world!"
  end
end
