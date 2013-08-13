# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_best_practices/formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_best_practices-formatter"
  spec.version       = RailsBestPractices::Formatter::VERSION
  spec.authors       = ["maroekun"]
  spec.email         = ["you05232050@gmail.com"]
  spec.description   = %q{implement!!!!!}
  spec.summary       = %q{implement!!!!!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
