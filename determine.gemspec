$:.unshift File.join(__FILE__, '..', 'lib')
require "determine/version"

Gem::Specification.new do |s|
  s.name        = "determine"
  s.version     = ::Determine::VERSION
  s.authors     = ["Tyler Smith"]
  s.summary     = %q{Provides tools for creating heuristic filters for text}
  s.summary     = %q{Provides tools for creating heuristic filters for text}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {harness}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'nokogiri'
end