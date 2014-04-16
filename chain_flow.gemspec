# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chain_flow/version'

Gem::Specification.new do |spec|
  spec.name          = "chain_flow"
  spec.version       = ChainFlow::VERSION
  spec.authors       = ["Innokenty Mihailov"]
  spec.email         = ["anotheroneman@yahoo.com"]
  spec.description   = %q{Provides functional-like syntax for data processing flows}
  spec.summary       = %q{Provides functional-like syntax for data processing flows}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
