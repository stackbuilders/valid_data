# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'valid_data/version'

Gem::Specification.new do |spec|
  spec.name          = "valid_data"
  spec.version       = ValidData::VERSION
  spec.authors       = ["Matt Campbell"]
  spec.email         = ["mecampbell25@gmail.com"]
  spec.summary       = %q{Quickly check whether the rows in your database are valid according to your ActiveRecord validations}
  spec.description   = %q{Quickly check whether the rows in your database are valid according to your ActiveRecord validations}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
