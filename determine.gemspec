$:.unshift File.join(__FILE__, '..', 'lib')
require 'determine/version'

Gem::Specification.new do |s|
  s.name        = 'determine'
  s.version     = ::Determine::VERSION
  s.authors     = ['Tyler Smith']
  s.homepage    = 'https://github.com/tyler-smith/determine'
  s.email       = 'tylersmith.me@gmail.com'
  s.summary     = 'Provides tools for creating heuristic filters for text'
  s.description = 'Allows you to build classes that brute force determinations from text'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'nokogiri'
end
