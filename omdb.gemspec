# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omdb/version'

Gem::Specification.new do |spec|
  spec.name          = "omdb"
  spec.version       = Omdb::VERSION
  spec.authors       = ["Jeroen van Baarsen"]
  spec.email         = ["jeroen@logiconline.nl"]
  spec.description   = %q{Easy gateway to the OMDB Api}
  spec.summary       = %q{Easy gateway to the OMDB Api}
  spec.homepage      = "http://github.com/jvanbaarsen/omdb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Productions gems
  spec.add_dependency "json"
  spec.add_dependency "rest-client"

  # Development gems
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "terminal-notifier-guard"
  spec.add_development_dependency "webmock"
end
