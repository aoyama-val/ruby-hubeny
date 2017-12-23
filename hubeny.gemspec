# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hubeny/version'

Gem::Specification.new do |spec|
  spec.name          = "hubeny"
  spec.version       = Hubeny::VERSION
  spec.authors       = ["Aoyama, Shotaro"]
  spec.email         = ["aosho235@gmail.com"]

  spec.summary       = %q{Calculate the distance of two latitudes and longitudes using Hubeny's formula.}
  spec.description   = %q{Calculate the distance of two latitudes and longitudes using Hubeny's formula.}
  spec.homepage      = "https://github.com/aoyama-val/ruby-hubeny"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["hubeny"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
