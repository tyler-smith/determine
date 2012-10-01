require 'rubygems'
require 'open-uri'
require 'nokogiri'

# Create our root module so we don't need to worry about it later, add ourselves
# to the load path, and get to work
module Determine;end

$:.unshift File.dirname(__FILE__)
require 'determine/exceptions/determination_exception'

require 'determine/web_page'
require 'determine/determination'
require 'determine/determiner'