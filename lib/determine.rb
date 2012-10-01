require 'open-uri'
require 'nokogiri'

# Create our root module so we don't need to worry about it later, add ourselves
# to the load path, and get to work
module Determine
  module Exceptions;end
end

$:.unshift File.dirname(__FILE__)
Dir[File.join(File.dirname(__FILE__), 'determine', '**','*.rb')].each { |f| require f }