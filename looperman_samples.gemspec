
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "looperman_samples/version"

Gem::Specification.new do |spec|
  spec.name          = "looperman_samples"
  spec.version       = LoopermanSamples::VERSION
  spec.authors       = ["'Harley Rayner'"]
  spec.email         = ["'harleymteden@gmail.com'"]

  spec.summary       = %q{"this is a ruby gem CLI for scraping samples from looperman"}
  spec.description   = %q{.}
  spec.homepage      = "https://github.com/harleyharl/looperman_samples"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", '~> 0'

  spec.add_dependency "nokogiri"
end
