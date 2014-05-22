# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'valid_data/version'

Gem::Specification.new do |spec|
  spec.name          = "valid_data"
  spec.version       = ValidData::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Matt Campbell", "Wojciech Mach"]
  spec.email         = ["support@stackbuilders.com"]
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/stackbuilders/valid_data"
  spec.summary       = "Quickly check whether the rows in your database are valid according to your ActiveRecord validations."
  spec.description   = <<-DESC
As your Rails projects evolve and grow, your model validations tend to change
as well. An unfortunate side effect of this evolution is that your table-
backed ActiveRecord::Base descendants end up with rows that instantiate invalid
model instances. ValidData generates a report for your Rails application,
notifying you exactly how many rows in your models are invalid for each model.
  DESC

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "rspec", "~> 2"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "rails", ">= 3.0"
end
